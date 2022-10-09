local present, cursor = pcall(require, "nvim-cursorline")
local ui = require("core.theme").ui
local spec = require("nightfox.spec").load(vim.g.theme_mode == "light" and ui.light_theme or ui.dark_theme)

if not present then
  return
end

local options = {
  cursorline = {
    enable = false,
  },
  cursorword = {
    enable = true,
    min_length = 2,
    hl = {
      underline = false,
      fg = spec.fg1,
      bg = spec.sel1,
      -- fg = spec.sel0,
      -- bg = spec.diag.hint,
    },
  },
}

cursor.setup(options)
