return {
  {
    "oxfist/night-owl.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "embark-theme/vim",
    name = "embark",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
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
  -- { "EdenEast/nightfox.nvim" }
}
