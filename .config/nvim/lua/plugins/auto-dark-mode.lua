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
        flavour = "latte"
      }

      vim.opt.background = "light"
      vim.cmd("colorscheme catppuccin")
    end
  }
}
