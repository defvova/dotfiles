local M = {
  "windwp/nvim-spectre",
  event = "BufRead",
  dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
}

function M.config()
  local spectre = require "spectre"

  local options = {
    line_sep_start = "┌--------------------------------------------------------",
    line_sep = "└--------------------------------------------------------",
  }

  spectre.setup(options)
end

return M
