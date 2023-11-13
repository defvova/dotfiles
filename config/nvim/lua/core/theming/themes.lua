-- https://github.com/aserowy/neocode

local options = require "core.nvim.options"
local option = options.scope.option

local M = {
  themes = {
    catppuccin = {
      style = { "latte", "frappe" },
      transparent = false,
      lualine = function(_)
        return "catppuccin"
      end,
      activate = function(style, transparent)
        require("catppuccin").setup {
          flavour = style,
          transparent_background = transparent,
          background = {
            light = "latte",
            dark = "frappe",
          },
          term_colors = true,
          dim_inactive = {
            enabled = false,
          },
          integrations = {
            notify = false,
            mini = false,
            gitsigns = true,
            hop = false,
            lsp_saga = true,
            mason = true,
            neotree = true,
            -- fidget = true,
            neogit = true,
            noice = false,
            cmp = true,
            dap = true,
            native_lsp = {
              enabled = true,
              virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
              },
              underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
              },
            },
            treesitter_context = false,
            treesitter = false,
            ts_rainbow2 = true,
            symbols_outline = true,
            telescope = true,
            which_key = true,
            lsp_trouble = true,
          },
          color_overrides = {},
          highlight_overrides = {
            frappe = function(C)
              return {
                NeoTreeNormal = { bg = C.base },
                NeoTreeNormalNC = { bg = C.base },
              }
            end,
          },
        }

        vim.cmd.colorscheme "catppuccin"
      end,
    },
    nightowl = {
      style = { "night-owl" },
      transparent = false,
      lualine = function(style)
        return style
      end,
      activate = function(style, transparent)
        vim.cmd.colorscheme(style)
      end,
    },
    edge = {
      style = { "edge" },
      transparent = false,
      lualine = function(style)
        return "edge"
      end,
      activate = function(style, transparent)
        if style == "edge" then
          vim.opt.background = "light"
        else
          vim.opt.background = "dark"
        end

        vim.cmd.colorscheme "edge"
        vim.g.edge_style = style
        vim.g.edge_better_performance = 1
      end,
    },
    kanagawa = {
      style = { "wave" },
      transparent = false,
      lualine = function(style)
        return "kanagawa"
      end,
      activate = function(style, transparent)
        require("kanagawa").setup {
          theme = style,
        }
        vim.cmd.colorscheme "kanagawa"
      end,
    },
    embark = {
      style = { "embark" },
      transparent = false,
      lualine = function(style)
        return "embark"
      end,
      activate = function(style, transparent)
        vim.cmd.colorscheme "embark"
      end,
    },
    oxocarbon = {
      style = { "oxocarbon" },
      transparent = false,
      lualine = function(style)
        return "auto"
      end,
      activate = function(style, transparent)
        vim.cmd.colorscheme "oxocarbon"
      end,
    },
    rosepine = {
      style = { "main", "moon", "dawn" },
      transparent = false,
      lualine = function(style)
        return "auto"
      end,
      activate = function(style, transparent)
        require("rose-pine").setup {
          variant = style,
        }
        if style == "dawn" then
          vim.opt.background = "light"
        else
          vim.opt.background = "dark"
        end
        vim.cmd.colorscheme "rose-pine"
      end,
    },
    nordic = {
      style = { "nordic" },
      transparent = false,
      lualine = function(style)
        return "nordic"
      end,
      activate = function(style, transparent)
        vim.cmd.colorscheme "nordic"
      end,
    },
  },
}

function M.activate_theme(theme, style, transparent)
  local entry = M.themes[theme]
  entry.activate(style, transparent)

  if transparent then
    options.set(option, "cursorline", false)
  else
    options.set(option, "cursorline", true)
  end

  require("lualine").setup {
    options = {
      theme = entry.lualine(style),
    },
  }
end

function M.get_lualine(theme, style)
  return M.themes[theme].lualine(style)
end

return M
