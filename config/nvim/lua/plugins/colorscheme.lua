return {
  { "sainnhe/edge", lazy = false, enabled = true },
  { "rebelot/kanagawa.nvim", lazy = false, enabled = false },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup {
        flavour = "frappe", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "frappe",
        },
        term_colors = true,
        dim_inactive = {
          enabled = true,
        },
        integrations = {
          notify = true,
          mini = true,
          gitsigns = true,
          hop = true,
          lsp_saga = true,
          mason = true,
          neotree = true,
          noice = true,
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
          treesitter_context = true,
          treesitter = true,
          ts_rainbow = true,
          symbols_outline = true,
          telescope = true,
          which_key = true,
          lsp_trouble = true,
        },
        color_overrides = {},
        highlight_overrides = {
          frappe = function(C)
            return {}
          end,
        },
      }

      -- vim.opt.background = "dark"
      vim.cmd "colorscheme catppuccin"
    end,
  },
  -- { "EdenEast/nightfox.nvim" }
}
