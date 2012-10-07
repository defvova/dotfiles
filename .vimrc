" VIM
color desert
set number
set expandtab ts=2 sw=2 ai
set showtabline=2                 " Always shows tabs on top
set backspace=indent,eol,start    " Intuitive backspacing.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set scrolloff=10                  " Show 3 lines of context around the cursor.
set visualbell                    " No beeping.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " Disable swp files
set shortmess=filmnrxtTI          " Disble intro message
set nohidden                      " Remove the buffer after tab close
set novisualbell
set list
set listchars=trail:•
set ignorecase
set nocompatible
filetype indent on                " Turn on file type detection.
syntax enable

autocmd BufWritePre *.* :%s/\s\+$//e
:map <C-s> :w<cr>
:map <C-a> <esc>ggVG<end>
:imap <C-s> <ESC>:w<cr>
nnoremap <esc> :noh<return><esc>
nnoremap <silent> <C-b> :BufExplorer<CR>

" Tabs
:map tt :tabnew<cr>
:map <S-tab> :tabprevious<cr>
:map <C-tab> :tabnext<cr>
:map tc :tabclose<cr>
:map <C-q> <ESC>:q!<cr>
:imap <S-tab> <ESC>:tabprevious<cr>i
:imap <C-tab> <ESC>:tabnext<cr>i

" move up and down lines with A-down and A-up (also works in visual mode)
:nnoremap <A-down> :m+<CR>==
:nnoremap <A-up> :m-2<CR>==
:inoremap <A-down> <Esc>:m+<CR>==gi
:inoremap <A-up> <Esc>:m-2<CR>==gi
:vnoremap <A-down> :m'>+<CR>gv=gv
:vnoremap <A-up> :m-2<CR>gv=gv

" Rgrep
:map <C-f> :Rgrep<cr>
:let Grep_Default_Filelist = '*.*'
:let Grep_Skip_Files = '*.log all.css all.js'
set nocompatible

"
autocmd BufNewFile,BufRead *.html.erb set ft=eruby.html
au Bufread,BufNewFile *.feature set filetype=gherkin
au! Syntax gherkin source ~/.vim/cucumber.vim

" reload .vimrc settings
autocmd! bufwritepost .vimrc source %
:set autoread                     " autorealod changed files

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" Rails
:map gv :Rview<cr>
:map gc :Rcontroller<cr>
:map gm :Rmodel<cr>
:map gh :Rhelper<cr>

" Nerdtree plugin
:map <F2> :NERDTreeToggle<cr>

"CtrlP plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_match_window_bottom = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " ignore
  " style Ctrlp
  hi CtrlPMode1 guifg=blue guibg=green
  hi CtrlPMode2 guifg=red guibg=yellow

" to start vim maximized
function! Maximize_Window()
  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction!

au GUIEnter * call Maximize_Window()"
