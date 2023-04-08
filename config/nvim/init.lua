--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h15:i"
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_input_macos_alt_is_meta = true
end

require "core.lazy"
