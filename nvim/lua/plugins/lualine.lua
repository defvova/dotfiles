local present, lualine = pcall(require, "lualine")
local ui = require("core.theme").ui
local winbar = require "plugins.winbar"

if not present then
  return
end

local options = {
  theme = vim.g.theme_mode == "light" and ui.light_theme or ui.dark_theme,
  icons_enabled = true,
  disabled_filetypes = {
    statusline = {},
    winbar = {
      "help",
      "startify",
      "dashboard",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "alpha",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
    },
  },
  winbar = {
    lualine_a = { winbar.show_winbar },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { "quickfix", "toggleterm", "symbols-outline", "nvim-tree", "fugitive" },
}

lualine.setup {
  options = options,
}
