local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- map({ 'n' }, '#', [[<cmd>let save_pos=getpos(".")<CR>#<cmd>call setpos('.', save_pos)<CR>]], { noremap = true, silent = true })
map(
  "n",
  "#",
  [[<cmd>lua vim.fn.setreg('/', '\\<' .. vim.fn.expand('<cword>') .. '\\>')<CR><cmd>set hlsearch<CR>]],
  { noremap = true, silent = true }
)

map("n", "<ESC>", "<cmd>lua require('notify').dismiss(); vim.cmd('noh')<CR>", { desc = "no highlight & no alerts" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- WARNING: keymap conflict
map("n", "tt", "<cmd>$tabnew<CR>", { desc = "new tab" })

-- Copy all
-- map("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "copy whole file" })

-- switch between windows
-- map("n", "<C-h>", "<C-w>h", { desc = "window left" })
-- map("n", "<C-l>", "<C-w>l", { desc = "window right" })
-- map("n", "<C-j>", "<C-w>j", { desc = "window down" })
-- map("n", "<C-k>", "<C-w>k", { desc = "window up" })

-- go to  beginning and end
map({ "i" }, "<C-b>", "<ESC>^i", { desc = "beginning of line" })
map({ "n" }, "<C-b>", "<ESC>^", { desc = "beginning of line" })
map({ "x" }, "<C-b>", "^", { desc = "beginning of line" })
map({ "n", "i", "x" }, "<C-e>", "<End>", { desc = "end of line" })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map({ "n", "v" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map({ "n", "v" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map({ "n", "v" }, "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map({ "n", "v" }, "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- Keymaps for better default experience
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map("v", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })

-- Better indenting
map("v", "<", "<gv", { desc = "dedent" })
map("v", ">", ">gv", { desc = "indent" })

-- map("n", "<leader>w", "<cmd> w! <CR>", { desc = "save file" })
-- map("n", "<leader>q", "<cmd>lua require('core.utils').smart_quit()<CR>", { desc = "quit", silent = true })
map("n", "<leader>q", "<cmd>q!<CR>", { desc = "quit", silent = true })

map("n", "c.", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "search and replace word under cursor" })
map("n", "c>", [[:%s/\V<C-r><C-a>//g<Left><Left>]], { desc = "search and replace WORD under cursor" })

-- Use ':Grep' or ':LGrep' to grep into quickfix|loclist
-- without output or jumping to first match
-- Use ':Grep <pattern> %' to search only current file
-- Use ':Grep <pattern> %:h' to search the current file dir

vim.cmd "command! -nargs=+ -complete=file Grep noautocmd silent grep! <args> | redraw! | copen"
vim.cmd "command! -nargs=+ -complete=file LGrep noautocmd silent lgrep! <args> | redraw! | lopen"
map("n", "<leader>sf", [[:Grep ]], { desc = "[S]earch in [F]iles" })

-- map("n", "zR", require('ufo').openAllFolds, { desc = "Unfold all" })
-- map("n", "zM", require('ufo').closeAllFolds, { desc = "Fold all" })
-- map("n", "<BS>", "zc", { desc = "Fold block" })

local ok, legendary = pcall(require, "legendary")
if not ok then
  return
end

vim.g.mc = vim.api.nvim_replace_termcodes([[y/\V<C-r>=escape(@", '/')<CR><CR>]], true, true, true)

function SetupMultipleCursors()
  vim.keymap.set(
    "n",
    "<Enter>",
    [[:nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z]],
    { remap = true, silent = true }
  )
end

local t = require "legendary.toolbox"
legendary.keymaps {
  {
    "`",
    ":",
    hide = true,
    description = "Command mode",
    mode = { "n", "v", "x" },
  },
  {
    ":",
    t.lazy_required_fn("telescope.builtin", "find_files", { hidden = true }),
    hide = true,
    description = "Search [F]iles",
  },
  { "<leader>rN", "<cmd> set rnu! <CR>", description = "[Config]: Toggle [R]elative [N]umber" },
  { "<S-b>", "<cmd> enew <CR>", description = "[NVIM]: New Buffer" },
  { "<leader>us", "<cmd> e $MYVIMRC | :cd %:p:h <CR>", description = "[NVIM]: [U]pdate [S]ettings" },

  {
    "c.",
    [[:%s/\<<C-r><C-w>\>//g<Left><Left>]],
    description = "[Replace]: Find and replace word under cursor",
  },
  {
    "c>",
    [[:%s/\V<C-r><C-a>//g<Left><Left>]],
    description = "[Replace]: Find and replace WORD under cursor",
  },
  -- Multiple Cursors
  -- http://www.kevinli.co/posts/2017-01-19-multiple-cursors-in-500-bytes-of-vimscript/
  -- https://github.com/akinsho/dotfiles/blob/45c4c17084d0aa572e52cc177ac5b9d6db1585ae/.config/nvim/plugin/mappings.lua#L298

  -- 1. Position the cursor anywhere in the word you wish to change;
  -- 2. Or, visually make a selection;
  -- 3. Hit cn, type the new word, then go back to Normal mode;
  -- 4. Hit `.` n-1 times, where n is the number of replacements.
  {
    itemgroup = "Multiple Cursors",
    icon = "",
    description = "Working with multiple cursors",
    keymaps = {
      {
        "cn",
        {
          n = { "*``cgn" },
          x = { [[g:mc . "``cgn"]], opts = { expr = true } },
        },
        description = "Inititiate",
      },
      {
        "cN",
        {
          n = { "*``cgN" },
          x = { [[g:mc . "``cgN"]], opts = { expr = true } },
        },
        description = "Inititiate (in backwards direction)",
      },

      -- 1. Position the cursor over a word; alternatively, make a selection.
      -- 2. Hit cq to start recording the macro.
      -- 3. Once you are done with the macro, go back to normal mode.
      -- 4. Hit Enter to repeat the macro over search matches.
      -- {
      --   "cq",
      --   {
      --     n = { [[:\<C-u>call v:lua.SetupMultipleCursors()<CR>*``qz]] },
      --     x = { [[":\<C-u>call v:lua.SetupMultipleCursors()<CR>gv" . g:mc . "``qz"]], opts = { expr = true } },
      --   },
      --   description = "Inititiate with macros",
      -- },
      -- {
      --   "cQ",
      --   {
      --     n = { [[:\<C-u>call v:lua.SetupMultipleCursors()<CR>#``qz]] },
      --     x = {
      --       [[":\<C-u>call v:lua.SetupMultipleCursors()<CR>gv" . substitute(g:mc, '/', '?', 'g') . "``qz"]],
      --       opts = { expr = true },
      --     },
      --   },
      --   description = "Inititiate with macros (in backwards direction)",
      -- },
    },
  },
}
