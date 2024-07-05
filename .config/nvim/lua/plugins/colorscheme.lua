return {
  {
    "oxfist/night-owl.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "embark-theme/vim",
    name = "embark",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.opt.background = "dark"
      vim.cmd "colorscheme embark"
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "sainnhe/edge",
    priority = 1000,
    lazy = false,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
  },
  -- {
  --   "lambdalisue/glyph-palette.vim",
  --   priority = 1000,
  --   lazy = false,
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup {
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
          hl.InclineNormal = {
            fg = "#ffffff",
          }
          hl.InclineNormalNC = {
            fg = "#fdfdfd",
          }
        end,
      }
      -- vim.opt.background = "dark"
      -- vim.cmd "colorscheme tokyonight-storm"
    end,
  },
  -- { "EdenEast/nightfox.nvim" }
}
