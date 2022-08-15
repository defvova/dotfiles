local present, _ = pcall(require, "vim-dadbod")

if not present then
  return
end

vim.g.db_ui_save_location = "~/.config/nvim/db_ui"
vim.g.db_ui_use_nerd_fonts = 1
