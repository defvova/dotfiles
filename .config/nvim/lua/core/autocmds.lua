-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

-- autocmds
local autocmd = vim.api.nvim_create_autocmd
local api = vim.api

-- Check if we need to reload the file when it changed
-- autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI", "TermClose", "TermLeave" }, { command = "checktime" })
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI", "TermClose", "TermLeave" }, {
  pattern = "*",
  command = "if mode() != 'c' | checktime | endif",
})

autocmd({ "FileChangedShellPost" }, {
  pattern = "*",
  command = 'echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None',
})

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
  callback = function()
    local mark = api.nvim_buf_get_mark(0, '"')
    local lcount = api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.conf", "*.conf.j2" },
  callback = function()
    -- vim.api.nvim_command "set commentstring=#%s"
    vim.api.nvim_command "set filetype=make"
  end,
})

-- autocmd("BufUnload", {
--   buffer = 0,
--   callback = function()
--     vim.opt.laststatus = 3
--   end,
-- })

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

autocmd({ "VimEnter", "BufRead" }, {
  pattern = "*",
  command = "call glyph_palette#apply()"
})

-- Automatically delete trailing DOS-returns and whitespace on file open and write.
autocmd({ "BufRead", "BufWritePre", "FileWritePre" }, {
  pattern = "*",
  command = [[silent! %s/[\r \t]\+$//]],
})

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Equalize window dimensions when resizing vim window
autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- windows to close
autocmd("FileType", {
  pattern = {
    "git",
    "help",
    "lspinfo",
    "notify",
    "man",
    "qf",
    "spectre_panel",
    "startuptime",
    "rm",
    "vim",
    "fugitive",
    "fugitiveblame",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
