local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

autocmd("FileType", {
  pattern = "norg",
  callback = function()
    -- vim.opt.laststatus = 0
    opt.number = false
    opt.showtabline = 0
    opt.cole = 1
    opt.foldlevel = 10
  end,
})

-- Automatically delete trailing DOS-returns and whitespace on file open and write.
autocmd({ "BufRead", "BufWritePre", "FileWritePre" }, {
  pattern = "*",
  command = [[silent! %s/[\r \t]\+$//]],
})

-- Equalize window dimensions when resizing vim window
autocmd("VimResized", {
  pattern = "*",
  command = [[tabdo wincmd =]],
})

autocmd("FocusGained", {
  pattern = "*",
  command = [[NvimTreeRefresh]],
})
autocmd("CursorHold", {
  pattern = "*",
  command = [[lua vim.diagnostic.open_float(nil, { focusable = false })]],
})

opt.gutentags_ctags_executable = "/opt/homebrew/bin/ctags"
opt.swapfile = false
opt.wildignore = "*/cache/*,*/tmp/*"

-- opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldcolumn = "auto:2"
-- opt.foldcolumn = "1"
opt.foldlevelstart = 99
opt.foldnestmax = 20
opt.foldminlines = 4

vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
