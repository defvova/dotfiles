"__         __  ________  __         __   __
"\ \       / / |  ____  | \ \       / /  /  \
" \ \     / /  | |    | |  \ \     / /  /  _ \
"  \ \   / /   | |    | |   \ \   / /  /  /_\ \
"   \ \_/ /    | |____| |    \ \_/ /  /  ____  \
"    \___/     |________|     \___/  /__/    \__\
"            _                              __ _
"           (_)                            / _(_)
"     __   ___ _ __ ___     ___ ___  _ __ | |_ _  __ _
"     \ \ / / | '_ ` _ \   / __/ _ \| '_ \|  _| |/ _` |
"      \ V /| | | | | | | | (_| (_) | | | | | | | (_| |
"       \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                                 __/ |
"                                                |___/

call plug#begin('~/.vim/plugged')

""""""""""""""""""""""""""""""""""""""""""""
"  List of plugins                         "
""""""""""""""""""""""""""""""""""""""""""""
" Make sure you use single quotes
"
" These need to come before the configuration options for the plugins since
" VimPlug will add the plugin folders to the runtimepath only after it has seen
" the plugin's Plugin command.

Plug 'tpope/vim-sensible'             " Think of sensible.vim as one step above 'nocompatible' mode: a universal set of defaults that (hopefully) everyone can agree on.
Plug 'elzr/vim-json'                  " A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing.
Plug 'mxw/vim-jsx'                    " React JSX syntax highlighting and indenting for vim.
Plug 'slim-template/vim-slim'         " Syntax highlighting for VIM
Plug 'godlygeek/tabular'              " The TABULAR plugin must come before vim-markdown.
Plug 'plasticboy/vim-markdown'        " Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
Plug 'tpope/vim-haml'                 " Vim runtime files for Haml, Sass, and SCSS
Plug 'pangloss/vim-javascript'        " Syntax highlighting for javascript
Plug 'kchmck/vim-coffee-script'       " CoffeeScript support for vim
Plug 'tpope/vim-endwise'              " Wisely add 'end' in ruby, endfunction/endif/more in vim script, etc.
Plug 'Raimondi/delimitMate'           " Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'ryanoasis/vim-devicons'         " Devicons - font icons to programming languages, libraries, and web developer filetypes for: NERDTree, powerline, vim-airline, ctrlp, unite, lightline.vim, vim-startify, vimfiler, and flagship
Plug 'vim-airline/vim-airline'        " Statusline - lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes' " Statusline Themes - A collection of themes for vim-airline
Plug 'tomtom/tcomment_vim'            " Comments - an extensible & universal comment vim-plugin that also handles embedded filetypes

" Surround - quoting/parenthesizing made simple.
" Example, 'Hello world!' to remove the delimiters entirely, press <ds'>
Plug 'tpope/vim-surround'

Plug 'jlanzarotta/bufexplorer'        " Bufexplorer - With bufexplorer, you can quickly and easily switch between buffers by using the one of the default public interfaces
Plug 'scrooloose/syntastic'           " Syntastic - syntax checking hacks for vim
Plug 'tpope/vim-rails'                " Rails - Ruby on Rails power tools
Plug 'wincent/command-t',   { 'do': 'rake make', 'on':  'CommandT' } " Command-T - Fast file navigation for VIM
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }              " Nerdtree Plugin - A tree explorer plugin for vim.

" Gitk - a Git wrapper so awesome, it should be illegal.
" Example, :Gblame, :Gbrowse
Plug 'tpope/vim-fugitive' | Plug 'gregsexton/gitv'

" Indent Guides.
" The default mapping to toggle the plugin is <Leader>ig
Plug 'nathanaelkane/vim-indent-guides'

Plug 'rizzatti/dash.vim'               " Search Dash.app from Vim. Example, :Dash respond_to
Plug 'tpope/vim-bundler'               " Lightweight support for Ruby's Bundler. Go to gemfile then :Bopen rails
Plug 'sjl/gundo.vim'                   " Gundo.vim is Vim plugin to visualize your Vim undo tree.

" Emmet — the essential toolkit for web-developers {
" Example, #page>div.logo+ul#navigation>li*5>a{Item $} and then type <c-y>,.
Plug 'mattn/emmet-vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Snippets - vim-snipmate default snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

" Interactive command execution in Vim.
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

Plug 'ervandew/supertab'       " SuperTab - Perform all your vim insert mode completions with Tab
Plug 'flazz/vim-colorschemes'  " Colorscheme - one colorscheme pack to rule them all!
Plug 'airblade/vim-gitgutter'  " A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks.
Plug 'qpkorr/vim-bufkill'      " In Vim, trying to unload, delete or wipe a buffer without closing the window or split?
Plug 'Valloric/MatchTagAlways' " A Vim plugin that always highlights the enclosing html/xml tags
Plug 'xolox/vim-misc'          " Miscellaneous auto-load Vim scripts
Plug 'xolox/vim-session'       " Extended session management for Vim

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""
"  vim-devicons                            "
""""""""""""""""""""""""""""""""""""""""""""

let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

""""""""""""""""""""""""""""""""""""""""""""
"  vim-airline                             "
""""""""""""""""""""""""""""""""""""""""""""

let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts=1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

""""""""""""""""""""""""""""""""""""""""""""
"  vim-airline-themes                      "
""""""""""""""""""""""""""""""""""""""""""""

let g:airline_theme='luna'

""""""""""""""""""""""""""""""""""""""""""""
"  tcomment_vim                            "
""""""""""""""""""""""""""""""""""""""""""""

map <C-c> <esc>gcc<end>
vmap <C-c> gc

""""""""""""""""""""""""""""""""""""""""""""
"  BufExplorer                             "
""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <C-b> :BufExplorer<CR>

""""""""""""""""""""""""""""""""""""""""""""
"  Syntastic                               "
""""""""""""""""""""""""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

""""""""""""""""""""""""""""""""""""""""""""
"  CommandT                                "
""""""""""""""""""""""""""""""""""""""""""""

set wildignore+=*.sql,*.log
set wildignore+=*.o,*.obj,.git,*.pyc,*.so,blaze*,READONLY,llvm,Library*
set wildignore+=CMakeFiles,packages/*,**/packages/*,**/node_modules/*

let g:CommandTWildIgnore=&wildignore . ",**/tmp/*"

let g:CommandTMatchWindowAtTop=1

nnoremap <silent> <tab> :CommandT<CR>
map <F9> :CommandTFlush<cr>

""""""""""""""""""""""""""""""""""""""""""""
"  NerdTree                                "
""""""""""""""""""""""""""""""""""""""""""""

map <F2> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pys$'] " Don't show pyc files
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1

""""""""""""""""""""""""""""""""""""""""""""
"  Rails                                   "
""""""""""""""""""""""""""""""""""""""""""""

map mv :Eview<cr>
map mc :Econtroller<cr>
map mm :Emodel<cr>
map mh :Ehelper<cr>
map mj :Ejavascript<CR>
map ms :Estylesheet<CR>

""""""""""""""""""""""""""""""""""""""""""""
"  VimIndentGuides                         "
""""""""""""""""""""""""""""""""""""""""""""

let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_color_change_percent = 7
let g:indent_guides_auto_colors = 1
set ts=2 sw=2 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

""""""""""""""""""""""""""""""""""""""""""""
"  Gundo                                   "
""""""""""""""""""""""""""""""""""""""""""""

nnoremap <F5> :GundoToggle<CR>

let g:gundo_width = 60
let g:gundo_preview_height = 40

""""""""""""""""""""""""""""""""""""""""""""
"  Snippets                                "
""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

""""""""""""""""""""""""""""""""""""""""""""
"  YouCompleteMe                           "
""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_filetype_specific_completion_to_disable = {'javascript': 1}

nnoremap <F4> :YcmForceCompileAndDiagnostics<CR>

""""""""""""""""""""""""""""""""""""""""""""
"  Session                                 "
""""""""""""""""""""""""""""""""""""""""""""
" you also need to run :SaveSession once to create the default.vim session that
" will then be autoloaded/saved from then on

let g:session_autoload        = 'no'
let g:session_autosave        = 'yes'
let g:session_default_to_last = 'yes'
let g:session_directory       = '~/.vim/sessions'

""""""""""""""""""""""""""""""""""""""""""""
"  BufKill                                 "
""""""""""""""""""""""""""""""""""""""""""""

map <C-o> :BD<cr>

""""""""""""""""""""""""""""""""""""""""""""
"  VimEasyAlign                            "
""""""""""""""""""""""""""""""""""""""""""""

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""
"  YouCompleteMe                           "
""""""""""""""""""""""""""""""""""""""""""""

autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif

""""""""""""""""""""""""""""""""""""""""""""
"  VIM UI                                  "
""""""""""""""""""""""""""""""""""""""""""""

" We reset the vimrc augroup. Autocommands are added to this group throughout
" the file
augroup vimrc
  autocmd!
augroup END

colorscheme desert                " github, mac_classic
set background=dark               " dark | light
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h14

set go-=L                         " Removes left hand scroll bar
set cpoptions+=$                  " puts a $ marker for the end of words/lines in cw/c$ commands
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
set nocompatible                  " Use ViMproved, don't emulate old vi
set shellslash
set cursorline                    " Highlight the current line
set lines=999 columns=999
set macmeta

" Automatically delete trailing DOS-returns and whitespace on file open and write.
augroup vimrc
  autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//
augroup END

""""""""""""""""""""""""""""""""""""""""""""
"  Custom mappings                         "
""""""""""""""""""""""""""""""""""""""""""""

" move text to left/right {
  vnoremap < <gv
  vnoremap > >gv
" }

" Save {
  map <C-s> :w<cr>
  imap <C-s> <ESC>:w<cr>
" }

" Clearing highlighted search {
  nnoremap <leader><esc> :noh<return><esc>
" }

" move up and down lines with A-down and A-up (also works in visual mode) {
  nnoremap <S-down> :m+<CR>==
  nnoremap <S-up> :m-2<CR>==
  inoremap <S-down> <Esc>:m+<CR>==gi
  inoremap <S-up> <Esc>:m-2<CR>==gi
  vnoremap <S-down> :m'>+<CR>gv=gv
  vnoremap <S-up> :m-2<CR>gv=gv
" }

" reload .vimrc settings {
  " autocmd! bufwritepost .vimrc source %
  " set autoread " autorealod changed files
" }

" WindowPopup color {
  :highlight Pmenu guibg=slategrey gui=bold
  :highlight Pmenu ctermbg=30 gui=bold
" }

" Permissions {
  cmap w!! %!sudo tee > /dev/null %
" }

" Using the silver searcher with Vim {
  " https://robots.thoughtbot.com/faster-grepping-in-vim
  " Also need ack (>= 2.0), of course. To install it follow the http://beyondgrep.com/install/

  if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
  endif

  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

  " bind \ (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

  map <C-f> :Ag -i<SPACE>
" }
