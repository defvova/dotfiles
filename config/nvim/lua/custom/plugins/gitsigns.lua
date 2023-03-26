return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  keys = {
    { "<leader>gd", "<cmd> Gitsigns diffthis HEAD <CR>", desc = "[G]it [D]iff" },
  },
  opts = {
    numhl = true,
    signs = {
      add = {
        -- text = "▎",
        text = "┃",
      },
      change = {
        -- text = "▎",
        text = "┃",
      },
      delete = {
        show_count = true,
      },
      topdelete = {
        show_count = true,
      },
      changedelete = {
        show_count = false,
        -- text = "▎",
        text = "┃",
      },
      untracked = {
        show_count = false,
        -- text = "▎",
        text = "┃",
      },
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
