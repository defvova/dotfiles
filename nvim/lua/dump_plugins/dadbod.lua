local function db_completion()
  require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
end

-- vim.g.db_ui_save_location = "~/.config/nvim/db_ui"
vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"
vim.g.db_ui_use_nerd_fonts = 1

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "sql",
  },
  command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "sql",
    "mysql",
    "plsql",
  },
  callback = function()
    vim.schedule(db_completion)
  end,
})

-- vim.api.nvim_exec(
--   [[
--         " autocmd! FileType sql setlocal omnifunc=vim_dadbod_completion#omni
--         autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
--     ]],
--   false
-- )
