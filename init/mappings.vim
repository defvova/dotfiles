""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Commentary                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map ÷ <Plug>CommentaryLine
vmap ÷ <Plug>Commentary

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  NerdTree                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <silent> « :call NERDTreeToggleInCurDir()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Rails                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map mv :Eview<cr>
map mc :Econtroller<cr>
map mm :Emodel<cr>
map mh :Ehelper<cr>
map mj :Ejavascript<CR>
map ms :Estylesheet<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Far                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap Ï :Farp<cr>
nnoremap ƒ :F <c-r>=expand("<cword>")<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  FZF                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if isdirectory('.git')
  " if in a git project, use :GFiles
  nnoremap π :GFiles --cached --others --exclude-standard<cr>
else
  " Search file
  nnoremap π :FZF<CR>
endif

" Fzf Buffers
nnoremap <silent> ; :Buffers<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy-motion shortcuts                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Easy-motion highlights first word letters bi-directionally
map + <Plug>(easymotion-bd-w)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Custom mappings                                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Clearing highlighted search
nnoremap <leader><esc> :noh<return><esc>

" Move text to left/right
vnoremap < <gv
vnoremap > >gv

" Save
map <C-s> :w<cr>
imap <C-s> <ESC>:w<cr>

" Move up and down lines with A-down and A-up (also works in visual mode)
nnoremap <A-down> :m+<CR>
nnoremap <A-up> :m-2<CR>
inoremap <A-down> <Esc>:m+<CR>
inoremap <A-up> <Esc>:m-2<CR>
vnoremap <A-down> :m'>+<CR>gv
vnoremap <A-up> :m-2<CR>gv

" Tabs
" nnoremap <D-S-{> :tabprevious<CR>
nnoremap <S-Tab> :tabnext<CR>
nnoremap tt :tabnew<CR>
inoremap <S-Tab> <Esc>:tabnext<CR>i

" Permissions
cmap w!! %!sudo tee > /dev/null %

"   <Space> - PageDown
"   -       - PageUp
noremap <Space> <PageDown>
noremap - <PageUp>

" Select all
nnoremap <C-a> <esc>ggVG<CR>
nnoremap <C-a> <esc>ggVG<CR>
inoremap <C-a> <esc>ggVG<CR>
inoremap <C-a> <esc>ggVG<CR>
vnoremap <C-a> <esc>ggVG<CR>
vnoremap <C-a> <esc>ggVG<CR>

" Coc
" ===================================================
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
