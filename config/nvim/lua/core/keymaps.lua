local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

map("n", "<ESC>", "<cmd> noh <CR>", { desc = "no highlight" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

map("n", "tt", "<cmd>$tabnew<CR>", { desc = "new tab" })
-- switch between windows
map("n", "<C-h>", "<C-w>h", { desc = "window left" })
map("n", "<C-l>", "<C-w>l", { desc = "window right" })
map("n", "<C-j>", "<C-w>j", { desc = "window down" })
map("n", "<C-k>", "<C-w>k", { desc = "window up" })

-- Copy all
map("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "copy whole file" })

-- go to  beginning and end
map("i", "<C-b>", "<ESC>^i", { desc = "beginning of line" })
map("i", "<C-e>", "<End>", { desc = "end of line" })

-- navigate within insert mode
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map({ "i", "v", "n" }, "<C-a>", "<ESC> ggVG<CR>", { desc = "select all" })

-- line numbers
map("n", "<leader>rN", "<cmd> set rnu! <CR>", { desc = "Toggle [R]elative [N]umber" })

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

-- new buffer
map("n", "<S-b>", "<cmd> enew <CR>", { desc = "new buffer" })

-- Resize with arrows
map("n", "<A-Up>", "<cmd> resize -2<CR>", { desc = "decrease height" })
map("n", "<A-Down>", "<cmd> resize +2<CR>", { desc = "increase height" })
map("n", "<A-Left>", "<cmd> vertical resize -2<CR>", { desc = "decrease width" })
map("n", "<A-Right>", "<cmd> vertical resize +2<CR>", { desc = "increase width" })

-- map("n", "<leader>Fc", require("core.cht").cht, { desc = "  Cheatsheets" })
-- map("n", "<leader>Fs", require("core.cht").stack_overflow, { desc = "  Stack Overflow" })

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

map("t", "<C-x>", termcodes "<C-\\><C-N>", { desc = "escape terminal mode" })

map("n", "<leader>us", "<cmd> e $MYVIMRC | :cd %:p:h <CR>", { desc = "[U]pdate [S]ettings" })
-- map("n", "<leader>w", "<cmd> w! <CR>", { desc = "save file" })
map("n", "<leader>q", "<cmd>lua require('core.utils').smart_quit()<CR>", { desc = "quit" })
map("n", "<leader>up", "<cmd> Lazy sync <CR>", { desc = "[U]pdate [P]lugins" })
-- map("n", "<leader>tt", "<cmd>lua require('core.utils').toggle_theme()<cr>", { desc = "toggle theme" })
