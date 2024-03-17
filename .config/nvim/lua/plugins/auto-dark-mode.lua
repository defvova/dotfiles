return {
  "f-person/auto-dark-mode.nvim",
  lazy = false,
  opts = {
    update_interval = 1000,
    set_dark_mode = function()
      require("core.theming.themes").activate_theme("nightowl", "night-owl", false)
      vim.opt.background = "dark"
      -- require "custom.plugins.theme"
    end,
    set_light_mode = function()
      require("core.theming.themes").activate_theme("edge", "edge", false)
      vim.opt.background = "light"
      vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = '#fafafa' })
      vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = '#fafafa' })
    end,
  }
}
