return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "   toggle NeoTree" },
  },
  dependencies = {
    {
      "s1n7ax/nvim-window-picker",
      config = function()
        require("window-picker").setup {
          autoselect_one = true,
          include_current = false,
          filter_rules = {
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { "neo-tree", "neo-tree-popup", "notify" },

              -- if the buffer type is one of following, the window will be ignored
              buftype = { "terminal", "quickfix" },
            },
          },
          other_win_hl_color = "#e35e4f",
        }
      end,
    },
  },
  opts = {
    hide_root_node = true,
    source_selector = {
      winbar = false,
      statusline = false,
    },
    filesystem = {
      follow_current_file = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          "node_modules",
          ".cache",
        },
        never_show = {
          ".DS_Store",
          ".git",
        },
      },
    },
    default_component_configs = {
      indent = {
        with_markers = false,
      },
      diagnostics = {
        symbols = {
          error = "",
          warn = "",
          hint = "",
          info = "",
        },
      },
    },
    window = {
      width = 45,
      mappings = {
        ["h"] = "close_node",
        ["l"] = "open",
        ["v"] = "open_vsplit",
      },
    },
  },
}

-- local M = {
--   "nvim-tree/nvim-tree.lua",
--   keys = {
--     { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "   toggle nvimtree" },
--   },
--   cmd = {
--     "NvimTreeToggle",
--   },
-- }
--
-- function M.config()
--   local nvimtree = require "nvim-tree"
--
--   local options = {
--     filters = {
--       dotfiles = false,
--       custom = { "node_modules", ".cache", "^.git$", ".DS_Store" },
--     },
--     trash = {
--       cmd = "trash",
--       require_confirm = true,
--     },
--     auto_reload_on_write = true,
--     disable_netrw = true,
--     hijack_netrw = true,
--     open_on_setup = false,
--     ignore_ft_on_setup = { "alpha" },
--     hijack_cursor = true,
--     hijack_unnamed_buffer_when_opening = false,
--     update_cwd = true,
--     update_focused_file = {
--       enable = true,
--       update_cwd = false,
--     },
--     view = {
--       adaptive_size = true,
--       side = "left",
--       width = 45,
--       hide_root_folder = true,
--       mappings = {
--         custom_only = false,
--         list = {
--           { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
--           { key = "h", action = "close_node" },
--           { key = "v", action = "vsplit" },
--           { key = "C", action = "cd" },
--         },
--       },
--     },
--     git = {
--       enable = true,
--       ignore = true,
--       timeout = 200,
--     },
--     filesystem_watchers = {
--       enable = true,
--     },
--     actions = {
--       open_file = {
--         resize_window = true,
--       },
--     },
--     renderer = {
--       highlight_git = true,
--       highlight_opened_files = "none",
--
--       indent_markers = {
--         enable = false,
--       },
--
--       icons = {
--         webdev_colors = true,
--         show = {
--           file = true,
--           folder = true,
--           folder_arrow = true,
--           git = true,
--         },
--
--         glyphs = {
--           default = "",
--           symlink = "",
--           folder = {
--             default = "",
--             empty = "",
--             empty_open = "",
--             open = "",
--             symlink = "",
--             symlink_open = "",
--             arrow_open = "",
--             arrow_closed = "",
--           },
--           git = {
--             unstaged = "✗",
--             staged = "✓",
--             unmerged = "",
--             renamed = "➜",
--             untracked = "★",
--             deleted = "",
--             ignored = "◌",
--           },
--         },
--       },
--     },
--   }
--
--   vim.g.nvimtree_side = options.view.side
--
--   nvimtree.setup(options)
-- end
--
-- return M
