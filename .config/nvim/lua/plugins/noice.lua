return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      progress = {
        enabled = false
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    views = {
      split = {
        win_options = {
          winhighlight = "Normal:Normal",
        },
      },
      mini = {
        win_options = {
          winblend = 0,
        },
      },
      popup = {
        border = {
          padding = { 0, 0 },
        },
        win_options = {
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "NormalFloatInv",
          },
        },
      },
      cmdline_popup = {
        position = {
          row = "35%",
          col = "50%",
        },
        border = {
          padding = { 0, 0 },
        },
        win_options = {
          -- winblend = 100,
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "NormalBorder",
          },
          cursorline = false,
        },
        size = {
          width = "auto",
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = "40%",
          col = "50%",
        },
        size = {
          width = 79,
          height = 10,
        },
        border = {
          padding = { 0, 0 },
        },
        win_options = {
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "NormalFloatInv",
          },
        },
      },
    },
    messages = {
      enabled = true,            -- enables the Noice messages UI
      view = "notify",           -- default view for messages
      view_error = "notify",     -- view for errors
      view_warn = "notify",      -- view for warnings
      view_history = "messages", -- view for :messages
      view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    notify = {
      enabled = true,
    },
    routes = {
      {
        filter = {
          any = {
            -- this filters messages to be shown by fidget
            { find = "^[^%s]+%s(%d+)L, (%d+)B%s+%[w%]$" },
          },
        },
        opts = {
          stop = true,
          skip = true, -- change to false to show
          format = {
            "{message}",
          },
        },
      },
    },
    presets = {
      bottom_search = false,        -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,           -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true,        -- add a border to hover docs and signature help
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- "rcarriga/nvim-notify",
  }
}
