return {
  {
    "oxfist/night-owl.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    -- config = function()
    --   -- load the colorscheme here
    --   vim.cmd.colorscheme "night-owl"
    -- end,
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
  },
  {
    "sainnhe/edge",
    priority = 1000,
    lazy = false,
    -- config = function()
    --   vim.opt.background = "light"
    -- end,
  },
  { "rebelot/kanagawa.nvim", lazy = false },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
  },
  -- { "EdenEast/nightfox.nvim" }
}
