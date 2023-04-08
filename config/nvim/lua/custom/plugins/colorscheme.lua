return {
  {
    "embark-theme/vim",
    name = "embark",
    lazy = false,
    enabled = require("core.custom").current_theme() == "embark",
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    enabled = require("core.custom").current_theme() == "oxocarbon",
  },
  { "sainnhe/edge", lazy = false, enabled = require("core.custom").current_theme() == "edge" },
  { "rebelot/kanagawa.nvim", lazy = false, enabled = false },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    enabled = require("core.custom").current_theme() == "catppuccin",
    opts = {
      flavour = "frappe", -- latte, frappe, macchiato, mocha
      background = {
        light = "latte",
        dark = "frappe",
      },
      term_colors = true,
      dim_inactive = {
        enabled = false,
      },
      integrations = {
        notify = false,
        mini = false,
        gitsigns = true,
        hop = false,
        lsp_saga = true,
        mason = true,
        neotree = true,
        noice = false,
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
        treesitter_context = false,
        treesitter = false,
        ts_rainbow = true,
        symbols_outline = true,
        telescope = true,
        which_key = true,
        lsp_trouble = true,
      },
      color_overrides = {},
      highlight_overrides = {
        frappe = function(C)
          return {
            NeoTreeNormal = { bg = C.base },
            -- NeoTreeNormalNC = { bg = C.base },
          }
        end,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd "colorscheme catppuccin"
    end,
  },
  -- { "EdenEast/nightfox.nvim" }
}
