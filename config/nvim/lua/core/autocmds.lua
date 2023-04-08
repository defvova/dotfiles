-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

-- autocmds
local autocmd = vim.api.nvim_create_autocmd
local api = vim.api

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

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

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  -- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end
vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.conf",
  callback = function()
    -- vim.api.nvim_command "set commentstring=#%s"
    vim.api.nvim_command "set filetype=make"
  end,
})

autocmd("OptionSet", {
  pattern = "background",
  -- pattern = "*",
  callback = function()
    -- package.loaded["catppuccin"] = nil
    -- package.loaded["catppuccin.groups.integrations.feline"] = nil
    -- vim.cmd "Lazy load catppuccin"
    vim.cmd("colorscheme " .. require("core.custom").current_theme())
  end,
})

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
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
    "toggleterm",
    "vim",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
