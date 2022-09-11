local present, lualine = pcall(require, "lualine")
local ui = require("core.theme").ui

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
}

lualine.setup {
  options = options,
}
