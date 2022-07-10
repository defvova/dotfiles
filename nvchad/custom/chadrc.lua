local M = {}

local override = require "custom.override"

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
  user = require "custom.plugins",
  override = {
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
    ["folke/which-key.nvim"] = override.whichkey,
    ["nvim-telescope/telescope.nvim"] = override.telescope,
  },
}

M.ui = {
  theme = "catppuccin_latte",
  -- hl_add = require "custom.highlights",
  theme_toggle = { "catppuccin", "catppuccin_latte" },
}

M.mappings = require "custom.mappings"

return M
