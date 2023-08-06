return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
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
      follow_current_file = {
        enabled = true,
      },
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
        -- expander_collapsed = "",
        -- expander_expanded = "",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
      },
      modified = {
        symbol = "",
      },
      diagnostics = {
        symbols = {
          error = "",
          warn = "",
          hint = "",
          info = "",
        },
      },
      git_status = {
        symbols = {
          ignored = "◌",
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
