-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

local custom_config = require "core.custom"

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd("FocusGained", { command = "checktime" })

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- autocmds
local autocmd = vim.api.nvim_create_autocmd
local api = vim.api

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = function()
    -- vim.cmd("packadd " .. custom_config.current_packer_theme())
    vim.cmd("colorscheme " .. custom_config.current_theme())
  end,
})

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- Disable statusline in dashboard
autocmd("FileType", {
  pattern = "alpha",
  callback = function()
    vim.opt.laststatus = 0
  end,
})

autocmd("BufUnload", {
  buffer = 0,
  callback = function()
    vim.opt.laststatus = 3
  end,
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

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

-- windows to close
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "git",
    "help",
    "lspinfo",
    "man",
    "qf",
    "spectre_panel",
    "startuptime",
    "toggleterm",
    "vim",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- store listed buffers in tab local var
-- vim.t.bufs = vim.api.nvim_list_bufs()

-- autocmds for tabufline -> store bufnrs on bufadd, bufenter events
-- thx to https://github.com/ii14 & stores buffer per tab -> table
-- autocmd({ "BufAdd", "BufEnter" }, {
--   callback = function(args)
--     if vim.t.bufs == nil then
--       vim.t.bufs = { args.buf }
--     else
--       local bufs = vim.t.bufs
--
--       -- check for duplicates
--       if not vim.tbl_contains(bufs, args.buf) and (args.event == "BufAdd" or vim.bo[args.buf].buflisted) then
--         table.insert(bufs, args.buf)
--         vim.t.bufs = bufs
--       end
--     end
--   end,
-- })

-- autocmd("BufDelete", {
--   callback = function(args)
--     for _, tab in ipairs(api.nvim_list_tabpages()) do
--       local bufs = vim.t[tab].bufs
--       if bufs then
--         for i, bufnr in ipairs(bufs) do
--           if bufnr == args.buf then
--             table.remove(bufs, i)
--             vim.t[tab].bufs = bufs
--             break
--           end
--         end
--       end
--     end
--   end,
-- })
