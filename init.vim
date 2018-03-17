"                                                      __         __  ________  __         __   __
"                                                      \ \       / / |  ____  | \ \       / /  /  \
"                                                       \ \     / /  | |    | |  \ \     / /  /  _ \
"                                                        \ \   / /   | |    | |   \ \   / /  /  /_\ \
"                                                         \ \_/ /    | |____| |    \ \_/ /  /  ____  \
"                                                          \___/     |________|     \___/  /__/    \__\
"                                                                  _                              __ _
"                                                                 (_)                            / _(_)
"                                                           __   ___ _ __ ___     ___ ___  _ __ | |_ _  __ _
"                                                           \ \ / / | '_ ` _ \   / __/ _ \| '_ \|  _| |/ _` |
"                                                            \ V /| | | | | | | | (_| (_) | | | | | | | (_| |
"                                                             \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                                                                                       __/ |
"                                                                                                      |___/

" Automatic installation VimPlug
" Place the following code before plug#begin()
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "  List of plugins                                                     "
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Make sure you use single quotes
  "
  " These need to come before the configuration options for the plugins since
  " VimPlug will add the plugin folders to the runtimepath only after it has seen the plugin's Plugin command.

  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Dark powered asynchronous completion framework for neovim/Vim8
  endif

  Plug 'mxw/vim-jsx'                    " React JSX syntax highlighting and indenting for vim.
  Plug 'pangloss/vim-javascript'        " Syntax highlighting for javascript
  Plug 'Raimondi/delimitMate'           " Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.

  " Nerdtree Plugin - A tree explorer plugin for vim.
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  augroup nerd_loader
    autocmd!
    autocmd VimEnter * silent! autocmd! FileExplorer
    autocmd BufEnter,VimEnter *
          \  if isdirectory(expand('<amatch>'))
          \|   call plug#load('nerdtree')
          \|   execute 'autocmd! nerd_loader'
          \| endif
  augroup END

  " Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
  Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'

  Plug 'jlanzarotta/bufexplorer' " Bufexplorer - With bufexplorer, you can quickly and easily switch between buffers by using the one of the default public interfaces
  Plug 'majutsushi/tagbar'       " Vim plugin that displays tags in a window, ordered by scope
  Plug 'ervandew/supertab'       " SuperTab - Perform all your vim insert mode completions with Tab
  Plug 'flazz/vim-colorschemes'  " Colorscheme - one colorscheme pack to rule them all!
  Plug 'airblade/vim-gitgutter'  " A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks.
  Plug 'tpope/vim-endwise'       " Wisely add 'end' in ruby, endfunction/endif/more in vim script, etc.
  Plug 'tpope/vim-rails'         " Rails - Ruby on Rails power tools
  Plug 'tpope/vim-bundler'       " Lightweight support for Ruby's Bundler. Go to gemfile then :Bopen rails
  Plug 'Valloric/MatchTagAlways' " A Vim plugin that always highlights the enclosing html/xml tags
  Plug 'w0rp/ale'                " Asynchronous Lint Engine
  Plug 'brooth/far.vim'          " Find And Replace Vim plugin
  Plug 'eugen0329/vim-esearch'   " Perform search in files easily
  Plug 'itchyny/lightline.vim'   " A light and configurable statusline/tabline plugin for Vim
  Plug 'mhinz/vim-startify'      " The fancy start screen for Vim.
  Plug 'joshdick/onedark.vim'    " A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.

  Plug 'ludovicchabant/vim-gutentags' " A Vim plugin that manages your tag files
  Plug 'tyrannicaltoucan/vim-quantum' " A Material color scheme for Vim.

  Plug 'editorconfig/editorconfig-vim' " This is an EditorConfig plugin for Vim.
  Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' } " Comment stuff out

  " Gitk - a Git wrapper so awesome, it should be illegal.
  " Example, :GV, :GV!, :Gbrowse
  Plug 'tpope/vim-fugitive' | Plug 'junegunn/gv.vim'

  " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
  Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }

  " Emmet — the essential toolkit for web-developers {
  " Example, #page>div.logo+ul#navigation>li*5>a{Item $} and then type <c-y>,.
  Plug 'mattn/emmet-vim'

  " A command-line fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  VimEsearch                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call esearch#map('<D-S-f>', 'esearch-word-under-cursor')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Far                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <D-f> :Far <c-r>=expand("<cword>")<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Bufexplorer                                                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <D-b> :BufExplorer<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  TagbarToggle                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Commentary                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <D-/> <Plug>CommentaryLine
vmap <D-/> <Plug>Commentary

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  NerdTree                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map « :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pys$'] " Don't show pyc files
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1

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
"  VimEasyAlign                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Lightline                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" hi StatusLine guifg=#7FC1CA guibg=#556873
" hi StatusLineNC guifg=#3C4C55 guibg=#556873
" hi StatusLineError guifg=#DF8C8C guibg=#556873
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

function! Git_branch()
  let l:branch = fugitive#head()
  return empty(l:branch)?'':'['.l:branch.']'
endfunction

function! AleStatusline()
  let count = ale#statusline#Count(bufnr(''))
  let errors = count['error'] ? printf(' %d E ', count['error']) : ''
  let warnings = count['warning'] ? printf(' %d W ', count['warning']) : ''
  let separator = count['error'] && count['warning'] ? '│' : ''

  return printf('%s%s%s', errors, separator, warnings)
endfunction

set statusline=""
set statusline+=%{Git_branch()}    " Git branch
set statusline+=\ "

set statusline+=%<%f               " filename
set statusline+=\ "
set statusline+=%h%m%r             " help/modified/readonly
set statusline+=%=                 " alignment group
set statusline+=%#StatusLineError# " start error highlight group
set statusline+=%{AleStatusline()} " errors from w0rp/ale
set statusline+=%#StatusLine#      " reset highlight group
set statusline+=\ "
set statusline+=L%l/%L             " line/total lines
set statusline+=\ "
" virtual column
set statusline+=C%02v

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Ale                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
" cycle through location list
nmap <silent> <leader>n <Plug>(ale_next_wrap)

let g:ale_rust_cargo_use_check = 1

if has('nvim')
  set inccommand=split
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Editorconfig                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Deoplete                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#auto_complete_delay = 50

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  FZF                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <D-p> :FZF<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  VIM UI                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" My favorite colors (hybrid, github, mac_classic, desert, onedark)
colorscheme quantum
set termguicolors
set background=dark " dark | light

set title                         " change the terminal's title
set go-=L                         " Removes left hand scroll bar
set guioptions-=T                 " Removes top toolbar
set guioptions-=r                 " Removes right hand scroll bar
set t_Co=256                      " Fix colors in the terminal
set shortmess+=I                  " Disable splash text
set number                        " Enable line number
set expandtab ts=2 sw=2 ai
set showtabline=2                 " Always shows tabs on top
set hlsearch                      " Highlight matches.
set showmatch                     " show matching bracket (briefly jump)
set visualbell                    " No beeping.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " Disable swp files
set shortmess=filmnrxtTI          " Disble intro message
set nohidden                      " Remove the buffer after tab close
set novisualbell
set mouse=a                       " automatically enable mouse usage
set list                          " use the listchars settings
set listchars=trail:•             " show space
set ignorecase                    " case insensitive search
set smartcase
set nocompatible                  " Use ViMproved, don't emulate old vi
set shellslash
set lines=999 columns=999

let g:quantum_italics = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Completion                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmode=list:full
set wildignore=*.o,*.obj,*~    "stuff to ignore when tab completing
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

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

" Clearing highlighted search
nnoremap <leader><esc> :noh<return><esc>

" Move up and down lines with A-down and A-up (also works in visual mode)
nnoremap <S-down> :m+<CR>
nnoremap <S-up> :m-2<CR>
inoremap <S-down> <Esc>:m+<CR>
inoremap <S-up> <Esc>:m-2<CR>
vnoremap <S-down> :m'>+<CR>gv
vnoremap <S-up> :m-2<CR>gv

" Permissions
cmap w!! %!sudo tee > /dev/null %
