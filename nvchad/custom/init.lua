require("custom.utils").reset_gui_font()
require("custom.utils").setup_neovide()

local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

autocmd({ "FileType" }, {
  pattern = "toml",
  command = [[lua require('cmp').setup.buffer { sources = { { name = 'crates' } } }]],
})
-- vim.cmd "au FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })"
-- autocmd("FileType", {
--   pattern = "sql,mysql,plsql",
--   command = [[lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })]],
-- })

-- autocmd("FileType", {
--   pattern = "norg",
--   callback = function()
--     -- vim.opt.laststatus = 0
--     opt.number = false
--     opt.showtabline = 0
--     opt.cole = 1
--     opt.foldlevel = 10
--   end,
-- })

-- Automatically delete trailing DOS-returns and whitespace on file open and write.
autocmd({ "BufRead", "BufWritePre", "FileWritePre" }, {
  pattern = "*",
  command = [[silent! %s/[\r \t]\+$//]],
})
autocmd("TextYankPost", {
  pattern = "*",
  command = [[silent! lua vim.highlight.on_yank()]],
})

-- Equalize window dimensions when resizing vim window
autocmd("VimResized", {
  pattern = "*",
  command = [[tabdo wincmd =]],
})

-- autocmd("FocusGained", {
--   pattern = "*",
--   command = [[NvimTreeRefresh]],
-- })
-- autocmd("CursorHold", {
--   pattern = "*",
--   command = [[lua vim.diagnostic.open_float(nil, { focusable = false })]],
-- })
opt.shiftwidth = 2
opt.swapfile = false
opt.wildignore = "*/cache/*,*/tmp/*"

vim.g.rust_clip_command = "pbcopy"
-- opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldcolumn = "auto:2"
-- opt.foldcolumn = "1"
opt.foldlevelstart = 99
opt.foldnestmax = 20
opt.foldminlines = 4
