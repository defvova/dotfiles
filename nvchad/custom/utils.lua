local M = {}

function M.setup_auto_format(ft, command)
  if not command then
    command = "lua vim.lsp.buf.formatting_sync()"
  end
  -- vim.cmd(string.format("autocmd BufWritePost *.%s %s", ft, command))
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = string.format("*.%s", ft),
    command = command,
  })
end

function M.smart_quit()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
  if modified then
    vim.ui.input({
      prompt = "You have unsaved changes. Quit anyway? (y/n) ",
    }, function(input)
      if input == "y" then
        vim.cmd "q!"
      end
    end)
  else
    vim.cmd "q!"
  end
end

return M
