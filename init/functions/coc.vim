" coc extensions
let g:coc_global_extensions = ['coc-css', 'coc-cssmodules', 'coc-html', 'coc-json', 'coc-snippets', 'coc-tabnine', 'coc-tsserver', 'coc-yaml', 'coc-git', 'coc-flutter', 'coc-marketplace', 'coc-zi', 'coc-lists', 'coc-tailwindcss']


if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

" function! s:show_hover_doc()
"   call timer_start(500, 'ShowDocIfNoDiagnostic')
" endfunction

" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()

nmap <leader>do <Plug>(coc-codeaction)
