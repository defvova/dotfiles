return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  init = function()
    require("legendary").keymaps({
      {
        "<leader>e",
        "<cmd>Neotree filesystem reveal toggle<cr>",
        description = "Explorer: Toggle NeoTree",
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      "s1n7ax/nvim-window-picker",
      version = '2.*',
      config = function()
        require("window-picker").setup {
          filter_rules = {
            autoselect_one = true,
            include_current_win = false,
            bo = {
              filetype = { "neo-tree", "neo-tree-popup", "notify" },
              buftype = { "terminal", "quickfix" },
            },
          },
          -- other_win_hl_color = "#e35e4f",
        }
      end,
    },
  },
  opts = {
    hide_root_node = true,
    filesystem = {
      async_directory_scan = "always",
      follow_current_file = {
        enabled = true,
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          "node_modules",
          ".cache",
          "package-lock.json",
          "Cargo.lock"
        },
        always_show = {
          ".env",
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
