return {
  "f-person/auto-dark-mode.nvim",
  lazy = false,
  enabled = true,
  opts = {
    update_interval = 1000,
    set_dark_mode = function()
      require("tokyonight").setup({
        sidebars = { "qf", "terminal", "packer" },
        lualine_bold = true,
        on_colors = function(colors)
          local bg_dark = colors.bg

          colors.bg_dark = bg_dark
          colors.bg_float = bg_dark
          colors.bg_popup = bg_dark
          colors.bg_sidebar = bg_dark
        end,
        on_highlights = function(hl)
          local util = require("tokyonight.util")

          hl.InclineNormal = {
            fg = '#ffffff'
          }
          hl.InclineNormalNC = {
            fg = util.darken('#ffffff', 0.6)
          }
        end,
      })
      vim.opt.background = "dark"
      vim.cmd("colorscheme tokyonight")
    end,
    set_light_mode = function()
      require("catppuccin").setup {
        flavour = "latte",
        integrations = {
          alpha = true,
          gitsigns = true,
          treesitter = true,
          notify = true,
          mason = true,
          neotree = true,
          noice = true,
          cmp = true,
          treesitter_context = true,
          ufo = true,
          lsp_trouble = true,
          illuminate = {
            enabled = true,
            lsp = true
          },
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
            inlay_hints = {
              background = true,
            },
          },
        },
        highlight_overrides = {
          latte = function(latte)
            local util = require("tokyonight.util")

            return {
              NeoTreeNormal = {
                bg = latte.base
              },
              NeoTreeNormalNC = {
                -- bg = util.darken(latte.base, 0.9)
                link = "NeoTreeNormal"
              },
              NormalFloat = {
                bg = latte.base
              },
              FloatBorder = {
                link = "NormalFloat"
              },
              FloatTitle = {
                link = "NormalFloat"
              },
              InclineNormal = {
                fg = '#000000'
              },
              InclineNormalNC = {
                fg = util.lighten('#000000', 0.6)
              }
            }
          end
        },
      }

      vim.opt.background = "light"
      vim.cmd("colorscheme catppuccin")
    end
  }
}
