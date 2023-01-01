local present, cursor = pcall(require, "nvim-cursorline")
local palette = require("core.theme").palette

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
      fg = palette.fg,
      bg = palette.bg,
    },
  },
}

cursor.setup(options)
