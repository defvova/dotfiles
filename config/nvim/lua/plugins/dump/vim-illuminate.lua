return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  enabled = false,
  config = function()
    require("illuminate").configure {
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 100,
      filetypes_denylist = {
        "alpha",
        "dashboard",
        "DoomInfo",
        "fugitive",
        "help",
        "norg",
        "NvimTree",
        "NeoTree",
        "Outline",
        "toggleterm",
      },
      under_cursor = true,
    }
    local palette = require("core.theme").palette
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { ctermbg = 0, bg = palette.bg_cursor_hl, fg = palette.fg_cursor_hl })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { ctermbg = 0, bg = palette.bg_cursor_hl, fg = palette.fg_cursor_hl })
    vim.api.nvim_set_hl(
      0,
      "IlluminatedWordWrite",
      { ctermbg = 0, bg = palette.bg_cursor_hl, fg = palette.fg_cursor_hl }
    )
  end,
}
