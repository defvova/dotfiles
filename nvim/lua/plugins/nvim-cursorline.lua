local M = {
  "yamatsum/nvim-cursorline",
  lazy = false,
}

function M.config()
  local cursor = require "nvim-cursorline"
  local palette = require("core.theme").palette

  local options = {
    cursorline = {
      enable = false,
    },
    cursorword = {
      enable = true,
      min_length = 2,
      hl = {
        underline = false,
        fg = palette.fg_cursor_hl,
        bg = palette.bg_cursor_hl,
      },
    },
  }

  cursor.setup(options)
end

return M
