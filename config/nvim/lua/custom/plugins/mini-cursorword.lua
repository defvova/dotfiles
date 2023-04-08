return {
  "echasnovski/mini.cursorword",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  config = function()
    require("mini.cursorword").setup {}

    local palette = require("core.theme").palette
    vim.api.nvim_set_hl(0, "MiniCursorword", { ctermbg = 0, bold = 1, underline = 1 })
    vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { ctermbg = 0, bold = 1, underline = 1 })
  end,
}
