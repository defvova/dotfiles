local assets = {
  left_separator = "",
  right_separator = "",
  mode_icon = "",
  dir = "",
  file = "",
  lsp = {
    server = "",
    error = "",
    warning = "",
    info = "",
    hint = "",
  },
  git = {
    branch = "",
    added = "",
    changed = "",
    removed = "",
  },
}

-- local mode_color = {
--   n = colors.red,
--   i = colors.green,
--   v = colors.blue,
--   [""] = colors.blue,
--   V = colors.blue,
--   c = colors.magenta,
--   no = colors.red,
--   s = colors.orange,
--   S = colors.orange,
--   [""] = colors.orange,
--   ic = colors.yellow,
--   R = colors.violet,
--   Rv = colors.violet,
--   cv = colors.red,
--   ce = colors.red,
--   r = colors.cyan,
--   rm = colors.cyan,
--   ["r?"] = colors.cyan,
--   ["!"] = colors.red,
--   t = colors.red,
-- }

local mode_colors = {
  ["n"] = "NORMAL",
  ["no"] = "N-PENDING",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["t"] = "TERMINAL",
  ["v"] = "VISUAL",
  ["V"] = "V-LINE",
  [""] = "V-BLOCK",
  ["R"] = "REPLACE",
  ["Rv"] = "V-REPLACE",
  ["s"] = "SELECT",
  ["S"] = "S-LINE",
  [""] = "S-BLOCK",
  ["c"] = "COMMAND",
  ["cv"] = "COMMAND",
  ["ce"] = "COMMAND",
  ["r"] = "PROMPT",
  ["rm"] = "MORE",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
}

return {
  "feline-nvim/feline.nvim",
  event = "BufReadPre",
  config = function()
    local lsp = require "feline.providers.lsp"
    local palette = require("core.theme").palette

    local sett = {
      text = palette.fg,
      bkg = palette.bg,
      diffs = palette.diffs,
      extras = palette.extras,
      curr_file = palette.accent,
      curr_dir = palette.accent_sec,
      show_modified = false,
    }

    local shortline = false
    local components = {
      active = { {}, {}, {} }, -- left, center, right
      inactive = { {} },
    }
    local function is_enabled(min_width)
      if shortline then
        return true
      end

      return vim.api.nvim_win_get_width(0) > min_width
    end

    -- global components
    local invi_sep = {
      str = " ",
      hl = {
        fg = sett.bkg,
        bg = sett.bkg,
      },
    }

    -- helpers
    local function any_git_changes()
      local gst = vim.b.gitsigns_status_dict -- git stats
      if gst then
        if gst["added"] and gst["added"] > 0
            or gst["removed"] and gst["removed"] > 0
            or gst["changed"] and gst["changed"] > 0
        then
          return true
        end
      end
      return false
    end

    -- #################### STATUSLINE ->

    -- ######## Left

    -- Current vi mode ------>
    local vi_mode_hl = function()
      return {
        fg = sett.text,
        bg = palette.mode_colors[vim.fn.mode()],
        style = "bold",
      }
    end

    components.active[1][1] = {
      provider = " " .. assets.mode_icon .. " ",
      hl = function()
        return {
          fg = sett.text,
          bg = palette.mode_colors[vim.fn.mode()],
        }
      end,
    }
    components.active[1][2] = {
      provider = function()
        return mode_colors[vim.fn.mode()] .. " "
      end,
      hl = vi_mode_hl,
    }
    -- enable if git diffs are not available
    components.active[1][3] = {
      provider = assets.right_separator,
      hl = function()
        return {
          fg = palette.mode_colors[vim.fn.mode()],
          bg = sett.bkg,
        }
      end,
      enabled = function()
        return not any_git_changes()
      end,
    }
    -- enable if git diffs are available
    components.active[1][4] = {
      provider = assets.right_separator,
      hl = function()
        return {
          fg = palette.mode_colors[vim.fn.mode()],
          bg = sett.diffs,
        }
      end,
      enabled = function()
        return any_git_changes()
      end,
    }
    -- Current vi mode ------>

    -- Diffs ------>
    components.active[1][5] = {
      provider = "git_diff_added",
      hl = {
        fg = sett.text,
        bg = sett.diffs,
      },
      icon = " " .. assets.git.added .. " ",
    }
    components.active[1][6] = {
      provider = "git_diff_changed",
      hl = {
        fg = sett.text,
        bg = sett.diffs,
      },
      icon = " " .. assets.git.changed .. " ",
    }
    components.active[1][7] = {
      provider = "git_diff_removed",
      hl = {
        fg = sett.text,
        bg = sett.diffs,
      },
      icon = " " .. assets.git.removed .. " ",
    }

    components.active[1][8] = {
      provider = " ",
      hl = {
        fg = sett.bkg,
        bg = sett.diffs,
      },
      enabled = function()
        return any_git_changes()
      end,
    }

    components.active[1][9] = {
      provider = assets.right_separator,
      hl = {
        fg = sett.diffs,
        bg = sett.bkg,
      },
      enabled = function()
        return any_git_changes()
      end,
    }
    -- Diffs ------>
    -- Extras ------>

    -- file progess
    components.active[1][10] = {
      provider = function()
        local current_line = vim.fn.line "."
        local total_line = vim.fn.line "$"

        if current_line == 1 then
          return "Top"
        elseif current_line == vim.fn.line "$" then
          return "Bot"
        end
        local result, _ = math.modf((current_line / total_line) * 100)
        return result .. "%%"
      end,
      -- enabled = shortline or function(winid)
      -- 	return vim.api.nvim_win_get_width(winid) > 90
      -- end,
      hl = {
        fg = sett.extras,
        bg = sett.bkg,
      },
      left_sep = invi_sep,
    }
    -- position
    components.active[1][11] = {
      provider = "position",
      -- enabled = shortline or function(winid)
      -- 	return vim.api.nvim_win_get_width(winid) > 90
      -- end,
      hl = {
        fg = sett.extras,
        bg = sett.bkg,
      },
      left_sep = invi_sep,
    }
    -- macro
    components.active[1][12] = {
      provider = "macro",
      enabled = function()
        return vim.api.nvim_get_option "cmdheight" == 0
      end,
      hl = {
        fg = sett.extras,
        bg = sett.bkg,
      },
      left_sep = invi_sep,
    }

    -- search count
    components.active[1][13] = {
      provider = "search_count",
      enabled = function()
        return vim.api.nvim_get_option "cmdheight" == 0
      end,
      hl = {
        fg = sett.extras,
        bg = sett.bkg,
      },
      left_sep = invi_sep,
    }
    -- Extras ------>

    -- ######## Left

    -- ######## Center

    -- Diagnostics ------>
    -- workspace loader
    components.active[2][1] = {
      provider = function()
        local Lsp = vim.lsp.util.get_progress_messages()[1]

        if Lsp then
          local msg = Lsp.message or ""
          local percentage = Lsp.percentage
          if not percentage then
            return ""
          end
          local title = Lsp.title or ""
          local spinners = {
            "",
            "",
            "",
          }
          local success_icon = {
            "",
            "",
            "",
          }
          local ms = vim.loop.hrtime() / 1000000
          local frame = math.floor(ms / 120) % #spinners

          if percentage >= 70 then
            return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
          end

          return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
        end

        return ""
      end,
      enabled = is_enabled(80),
      hl = {
        -- fg = C.rosewater,
        bg = sett.bkg,
      },
    }

    -- general diagnostics (errors, warnings. info and hints)
    components.active[2][2] = {
      provider = "diagnostic_errors",
      enabled = function()
        return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
      end,

      hl = {
        -- fg = C.red,
        bg = sett.bkg,
      },
      icon = " " .. assets.lsp.error .. " ",
    }

    components.active[2][3] = {
      provider = "diagnostic_warnings",
      enabled = function()
        return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
      end,
      hl = {
        -- fg = C.yellow,
        bg = sett.bkg,
      },
      icon = " " .. assets.lsp.warning .. " ",
    }

    components.active[2][4] = {
      provider = "diagnostic_info",
      enabled = function()
        return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
      end,
      hl = {
        -- fg = C.sky,
        bg = sett.bkg,
      },
      icon = " " .. assets.lsp.info .. " ",
    }

    components.active[2][5] = {
      provider = "diagnostic_hints",
      enabled = function()
        return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
      end,
      hl = {
        -- fg = C.rosewater,
        -- bg = sett.bkg,
      },
      icon = " " .. assets.lsp.hint .. " ",
    }
    -- Diagnostics ------>

    -- ######## Center

    -- ######## Right

    components.active[3][1] = {
      provider = "git_branch",
      enabled = is_enabled(70),
      hl = {
        fg = sett.extras,
        bg = sett.bkg,
      },
      icon = assets.git.branch .. " ",
      right_sep = invi_sep,
    }

    components.active[3][2] = {
      provider = function()
        if next(vim.lsp.buf_get_clients()) ~= nil then
          return assets.lsp.server .. " " .. "Lsp"
        else
          return ""
        end
      end,
      hl = {
        fg = sett.extras,
        bg = sett.bkg,
      },
      right_sep = invi_sep,
    }

    components.active[3][3] = {
      provider = function()
        local filename = vim.fn.expand "%:t"
        local extension = vim.fn.expand "%:e"
        local present, icons = pcall(require, "nvim-web-devicons")
        local icon = present and icons.get_icon(filename, extension) or assets.file
        return (sett.show_modified and "%m" or "") .. " " .. icon .. " " .. filename .. " "
      end,
      enabled = is_enabled(70),
      -- hl = {
      --   fg = sett.text,
      --   bg = sett.curr_file,
      -- },
      left_sep = {
        str = assets.left_separator,
        -- hl = {
        --   fg = sett.curr_file,
        --   bg = sett.bkg,
        -- },
      },
    }

    components.active[3][4] = {
      provider = function()
        local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        return " " .. assets.dir .. " " .. dir_name .. " "
      end,
      enabled = is_enabled(80),
      -- hl = {
      --   fg = sett.text,
      --   bg = sett.curr_dir,
      -- },
      left_sep = {
        str = assets.left_separator,
        -- hl = {
        --   fg = sett.curr_dir,
        --   bg = sett.curr_file,
        -- },
      },
    }
    -- ######## Right

    -- Inanctive components
    components.inactive[1][1] = {
      provider = function()
        return " " .. string.upper(vim.bo.ft) .. " "
      end,
      -- hl = {
      --   fg = C.overlay2,
      --   bg = C.mantle,
      -- },
    }
    require("feline").setup {
      components = components,
    }
  end,
}

-- local M = {
--   "nvim-lualine/lualine.nvim",
--   event = "BufReadPre",
-- }
--
-- local assets = {
--   left_separator = "",
--   right_separator = "",
--   mode_icon = "",
--   dir = "",
--   file = "",
--   lsp = {
--     server = "",
--     error = "",
--     warning = "",
--     info = "",
--     hint = "",
--   },
--   git = {
--     branch = "",
--     added = "",
--     changed = "",
--     removed = "",
--   },
-- }
--
-- function M.config()
--   local lualine = require "lualine"
--   local palette = require("core.theme").palette
--
--   local function lsp_client(msg)
--     msg = msg or "No Active Lsp"
--     local buf_clients = vim.lsp.buf_get_clients()
--     if next(buf_clients) == nil then
--       if type(msg) == "boolean" or #msg == 0 then
--         return ""
--       end
--       return msg
--     end
--
--     local buf_client_names = {}
--
--     for _, client in pairs(buf_clients) do
--       if client.name ~= "null-ls" then
--         table.insert(buf_client_names, client.name)
--       end
--     end
--
--     return table.concat(buf_client_names, ", ")
--   end
--
--   local options = {
--     options = {
--       component_separators = { left = "", right = "" },
--       section_separators = { left = "", right = "" },
--       theme = "auto",
--       icons_enabled = true,
--       disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
--       globalstatus = true,
--     },
--     sections = {
--       lualine_a = {
--         function()
--           return "▊"
--         end,
--         color = { fg = palette.accent }, -- Sets highlighting of component
--         padding = { left = 0, right = 1 }, -- We don't need space before this
--       },
--       lualine_b = {
--         "progress",
--         "location",
--         -- "branch",
--         -- "diff",
--         -- {
--         --   "diagnostics",
--         --   sources = { "nvim_lsp" },
--         --   symbols = { error = " ", warn = " ", info = " ", hint = " " },
--         --   colored = true,
--         -- },
--       },
--       lualine_c = {
--         {
--           lsp_client,
--           icon = " LSP:",
--           color = { fg = palette.accent, gui = "bold" },
--           on_click = function()
--             vim.cmd [[LspInfo]]
--           end,
--         },
--       },
--       lualine_x = {
--         { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
--         { "filename", path = 0, symbols = { modified = "  ", readonly = "", unnamed = "" } },
--         {
--           function()
--             local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
--             return dir_name
--           end,
--           icon = assets.dir,
--           color = {
--             fg = palette.accent,
--           },
--         },
--       },
--       lualine_y = {},
--       lualine_z = {},
--     },
--     extensions = { "quickfix", "toggleterm", "symbols-outline", "nvim-tree" },
--   }
--
--   lualine.setup(options)
-- end
--
-- return M
