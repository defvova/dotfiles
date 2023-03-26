return {
  "echasnovski/mini.cursorword",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  config = function()
    require("mini.cursorword").setup {}

    local palette = require("core.theme").palette
    vim.api.nvim_set_hl(0, "MiniCursorword", { ctermbg = 0, bg = palette.bg_cursor_hl, fg = palette.fg_cursor_hl })
    vim.api.nvim_set_hl(
      0,
      "MiniCursorwordCurrent",
      { ctermbg = 0, bg = palette.bg_cursor_hl, fg = palette.fg_cursor_hl }
    )
  end,
}
