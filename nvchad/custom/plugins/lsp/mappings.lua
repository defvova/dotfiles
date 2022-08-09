local M = {}

local function show_documentation()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    require("lspsaga.hover").render_hover_doc()
  end
end

function M.setup(bufnr)
  local opts = { noremap = true, silent = true, nowait = false }

  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua show_documentation()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(
  --   bufnr,
  --   "n",
  --   "<C-u>",
  --   "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<CR>",
  --   opts
  -- )
  -- vim.api.nvim_buf_set_keymap(
  --   bufnr,
  --   "n",
  --   "<C-d>",
  --   "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<CR>",
  --   opts
  -- )
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  --
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>lua require('renamer').rename()<CR>", opts)
end

return M
