return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  opts = {
    signcolumn = true,
    numhl = true,
    linehl = false,
    word_diff = false,
    sign_priority = 6,
    current_line_blame = false,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 100,
      ignore_whitespace = false,
    },
    signs = {
      add = { show_count = false, text = "┃" },
      change = { show_count = false, text = "┃" },
      delete = { show_count = true },
      topdelete = { show_count = true },
      changedelete = { show_count = true },
    },
    count_chars = {
      [1] = "₁",
      [2] = "₂",
      [3] = "₃",
      [4] = "₄",
      [5] = "₅",
      [6] = "₆",
      [7] = "₇",
      [8] = "₈",
      [9] = "₉",
      ["+"] = "₊",
    },
  },
}
