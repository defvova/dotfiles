local M = {}

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

-- set guifont=FiraCode\ Nerd\ Font:h14
M.setup_neovide = function()
  local cmd = vim.api.nvim_command

  cmd [[
    let g:neovide_input_macos_alt_is_meta=v:true
    let g:neovide_input_use_logo = v:true

    let g:neovide_hide_mouse_when_typing = 1
    let g:neovide_cursor_animation_length = 0.05
    let g:neovide_cursor_vfx_mode = 'railgun'

    function Neovide_fullscreen()
    if g:neovide_fullscreen == v:false
        let g:neovide_fullscreen=v:true
    else
        let g:neovide_fullscreen=v:false
    endif
    endfunction

    nnoremap <silent> <F12> :call Neovide_fullscreen()<CR>
    inoremap <silent> <F12> <C-o>:call Neovide_fullscreen()<CR>
    vnoremap <silent> <F12> <ESC>:call Neovide_fullscreen()<CR>gv
  ]]
end

local function refresh_gui_font()
  vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end

M.resize_gui_font = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  refresh_gui_font()
end

M.reset_gui_font = function()
  vim.g.gui_font_default_size = 14
  vim.g.gui_font_size = vim.g.gui_font_default_size
  vim.g.gui_font_face = "FiraCode Nerd Font Mono"

  vim.g.gui_font_size = vim.g.gui_font_default_size
  refresh_gui_font()
end

return M
