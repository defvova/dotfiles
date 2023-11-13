vim.wo.spell = false
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<A-Enter>",
  function()
    vim.cmd.RustLsp('codeAction')
  end,
  { silent = true, buffer = bufnr }
)
