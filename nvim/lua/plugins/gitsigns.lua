local present, gitsigns = pcall(require, "gitsigns")

if not present then
  return
end

local options = {
  signcolumn = true,
  numhl = true,
  linehl = false,
  word_diff = false,
  sign_priority = 6,
  
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 100,
    ignore_whitespace = false,
  },
  signs = {
    add          = { show_count = false, text = '┃' },
    change       = { show_count = false, text = '┃' },
    delete       = { show_count = true },
    topdelete    = { show_count = true },
    changedelete = { show_count = true },
  },
  count_chars = {
    [1]   = '₁',
    [2]   = '₂',
    [3]   = '₃',
    [4]   = '₄',
    [5]   = '₅',
    [6]   = '₆',
    [7]   = '₇',
    [8]   = '₈',
    [9]   = '₉',
    ['+'] = '₊',
  },
  -- signs = {
  --   add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
  --   change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
  --   delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
  --   topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
  --   changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
  -- },
  -- signs = {
  --   add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
  --   change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  --   delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
  --   topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
  --   changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  -- },
}

gitsigns.setup(options)
