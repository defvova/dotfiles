""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Commentary                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map ÷ <Plug>CommentaryLine
vmap ÷ <Plug>Commentary

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Ranger                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <silent> « :Ranger<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Rails                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map mv :Eview<cr>
" map mc :Econtroller<cr>
" map mm :Emodel<cr>
" map mh :Ehelper<cr>
" map mj :Ejavascript<CR>
" map ms :Estylesheet<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  RG search                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap ƒ :Rg <c-r>=expand("<cword>")<cr>

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

" nnoremap <S-Tab> :Windows<CR>
" inoremap <S-Tab> <Esc>:Windows<CR>i

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy-motion shortcuts                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Easy-motion highlights first word letters bi-directionally
map + <Plug>(easymotion-bd-w)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC-Flutter                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F5> :CocList --input=flutter commands<CR>

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
nnoremap tt :tabnew<CR>
" nnoremap <S-Tab> :tabnext<CR>
" inoremap <S-Tab> <Esc>:tabnext<CR>i
" Go to tab by number
noremap 1 1gt
noremap 2 2gt
noremap 3 3gt
noremap 4 4gt
noremap 5 5gt
noremap 6 6gt
noremap 7 7gt
noremap 8 8gt
noremap 9 9gt
noremap 0 :tablast<cr>

" Permissions
cmap w!! %!sudo tee > /dev/null %

"   <Space> - PageDown
"   -       - PageUp
noremap = <PageDown>
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

" " open new split panes to right and below
" set splitright
" set splitbelow
" " turn terminal to normal mode with escape
" tnoremap <Esc> <C-\><C-n>
" " start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" " open terminal on ctrl+n
" function! OpenTerminal()
"   split term://bash
"   resize 10
" endfunction
" nnoremap <c-n> :call OpenTerminal()<CR>
