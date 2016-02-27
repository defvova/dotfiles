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
"

" let Vundle manage Vundle {
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
" }

" Required! {
  Plugin 'VundleVim/Vundle.vim'
" }

" My Bundles here {
    Plugin 'tpope/vim-endwise'            " Wisely add 'end' in ruby, endfunction/endif/more in vim script, etc.
    Plugin 'Raimondi/delimitMate'         " Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
  " Syntax highlight {
    Plugin 'elzr/vim-json'                " A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing.
    Plugin 'mxw/vim-jsx'                  " React JSX syntax highlighting and indenting for vim.
    Plugin 'slim-template/vim-slim'       " Syntax highlighting for VIM
    Plugin 'godlygeek/tabular'            " The TABULAR plugin must come before vim-markdown.
    Plugin 'plasticboy/vim-markdown'      " Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
    Plugin 'tpope/vim-haml'               " Vim runtime files for Haml, Sass, and SCSS
    Plugin 'pangloss/vim-javascript'      " Syntax highlighting for javascript
    Plugin 'kchmck/vim-coffee-script.git' " CoffeeScript support for vim
  " }

  " Devicons - font icons to programming languages, libraries, and web developer filetypes for: NERDTree, powerline, vim-airline, ctrlp, unite, lightline.vim, vim-startify, vimfiler, and flagship {
    Plugin 'ryanoasis/vim-devicons'

    let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
  " }

  " Statusline - lean & mean status/tabline for vim that's light as air {
    Plugin 'vim-airline/vim-airline'

    let g:Powerline_symbols = 'fancy'
    let g:airline_powerline_fonts=1
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#hunks#enabled=0
    let g:airline#extensions#branch#enabled=1
  " }

  " Statusline Themes - A collection of themes for vim-airline {
    Plugin 'vim-airline/vim-airline-themes'

    let g:airline_theme='luna'
  " }

  " Comments - an extensible & universal comment vim-plugin that also handles embedded filetypes {
    Plugin 'tomtom/tcomment_vim'

    map <C-c> <esc>gcc<end>
    vmap <C-c> gc
  " }

  " Surround - quoting/parenthesizing made simple {
    " Example - ("Hello world!") To remove the delimiters entirely, press <ds">
    Plugin 'tpope/vim-surround'
  " }

  " Bufexplorer - With bufexplorer, you can quickly and easily switch between buffers by using the one of the default public interfaces {
    Plugin 'jlanzarotta/bufexplorer'

    nnoremap <silent> <C-b> :BufExplorer<CR>
  " }

  " Syntastic - syntax checking hacks for vim {
    Plugin 'scrooloose/syntastic'

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    " let g:syntastic_javascript_jshint_conf = $HOME . '/.jshint'
    " let g:syntastic_javascript_checker = 'jshint'
    " let g:syntastic_javascript_jshint_args = '--config /Users/vova/.rvm/gems/ruby-2.2.2/bin/jshint'

    let g:syntastic_enable_signs=1
    let g:syntastic_quiet_messages = {'level': 'warnings'}
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
  " }

  " Command-T - Fast file navigation for VIM {
    Plugin 'wincent/command-t'

    set wildignore+=*.sql,*.log,*.git
    nnoremap <silent> <tab> :CommandT<CR>
    let g:CommandTCursorRightMap=['<C-r>']
    let g:CommandTAcceptSelectionTabMap=['<C-l>']
    let g:CommandTMatchWindowAtTop=1
    let g:CommandTWildIgnore=&wildignore . ",**/tmp/*"
    map <F9> :CommandTFlush<cr>
  " }

  " Nerdtree plugin - A tree explorer plugin for vim. {
    Plugin 'scrooloose/nerdtree'

    :map <F2> :NERDTreeToggle<cr>
    :let NERDTreeIgnore=['\.pys$'] " Don't show pyc files
    :let NERDTreeChDirMode=0
    :let NERDTreeQuitOnOpen=1
  " }

  " Rails - Ruby on Rails power tools {
    Plugin 'tpope/vim-rails'

    :map mv :Eview<cr>
    :map mc :Econtroller<cr>
    :map mm :Emodel<cr>
    :map mh :Ehelper<cr>
    :map mj :Ejavascript<CR>
    :map ms :Estylesheet<CR>
  " }

  " Gitk - a Git wrapper so awesome, it should be illegal {
    " Gblame, Gbrowse
    Plugin 'tpope/vim-fugitive'
    Plugin 'gregsexton/gitv'
  " }

  " Indent Guides {
    " The default mapping to toggle the plugin is <Leader>ig
    Plugin 'nathanaelkane/vim-indent-guides'

    let g:indent_guides_auto_colors = 1
    set ts=2 sw=2 et
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
  " }

  " Search Dash.app from Vim {
    " Dash respond_to
    Plugin 'rizzatti/dash.vim'
  " }

  " Lightweight support for Ruby's Bundler {
    " Go to gemfile then Bopen rails
    Plugin 'tpope/vim-bundler'
  " }

  " Gundo.vim is Vim plugin to visualize your Vim undo tree. {
    Plugin 'sjl/gundo.vim'
    nnoremap <F5> :GundoToggle<CR>

    let g:gundo_width = 60
    let g:gundo_preview_height = 40
  " }


  " Emmet — the essential toolkit for web-developers {
    " Example
    " #page>div.logo+ul#navigation>li*5>a{Item $}
    " and then type <c-y>,

    Plugin 'mattn/emmet-vim'
  " }

  " Snippets - vim-snipmate default snippets {
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'

    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'

    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

    let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.
  " }

  " Other {
    Plugin 'ervandew/supertab'      " SuperTab - Perform all your vim insert mode completions with Tab
    Plugin 'Valloric/YouCompleteMe' " A code-completion engine for Vim
    Plugin 'flazz/vim-colorschemes' " Colorscheme - one colorscheme pack to rule them all!
    Plugin 'xolox/vim-misc.git'     " Miscellaneous auto-load Vim scripts
    Plugin 'airblade/vim-gitgutter' " A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks.
  " }
" }

" All of your Plugins must be added before the following line {
  filetype indent on                " required! Turn on file type detection.
  call vundle#end()                 " required!
" }

" VIM Ui {
  syntax enable

  let g:solarized_termcolors=256
  let g:solarized_termtrans = 1
  let g:solarized_degrade = 0
  let g:solarized_bold = 1
  let g:solarized_underline = 1
  let g:solarized_italic = 1
  let g:solarized_contrast = "normal"
  let g:solarized_visibility= "normal"
  colorscheme desert " github, mac_classic
  set background=dark " dark | light

  set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h14
  set go-=L                         " Removes left hand scroll bar
  set cpoptions+=$                  " puts a $ marker for the end of words/lines in cw/c$ commands
  set guioptions-=T                 " Removes top toolbar
  set guioptions-=r                 " Removes right hand scroll bar
  set encoding=utf-8
  set t_Co=256                      " Fix colors in the terminal
  set shortmess+=I                  " Disable splash text
  set number                        " Enable line number
  set expandtab ts=2 sw=2 ai
  set showtabline=2                 " Always shows tabs on top
  set backspace=indent,eol,start    " Intuitive backspacing.
  set incsearch                     " Highlight matches as you type.
  set hlsearch                      " Highlight matches.
  set scrolloff=3                   " Show 3 lines of context around the cursor.
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
  set laststatus=2                  " StatusLine
  set cursorline                    " Highlight the current line
  set lines=999 columns=999
  set wildmenu
  " set autochdir
  " filetype off                      " !include
  " filetype plugin indent on         " Automatically detect file types.
  syntax on                         " syntax highlighting

  autocmd BufWritePre *.* :%s/\s\+$//e " Delete all trailing whitespace
  autocmd BufNewFile,BufRead *.html.erb set ft=eruby.html
  au Bufread,BufNewFile *.feature set filetype=gherkin

  " ruby {
    autocmd FileType ruby set omnifunc=rubycomplete#Complete
    autocmd FileType ruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby let g:rubycomplete_rails = 1
    autocmd FileType ruby let g:rubycomplete_classes_in_global = 1
  " }
" }

" move text to left/right {
  vnoremap < <gv
  vnoremap > >gv
" }

" Save {
  :map <C-s> :w<cr>
  :imap <C-s> <ESC>:w<cr>
" }

" Clearing highlighted search {
  nnoremap <leader><esc> :noh<return><esc>
" }

" move up and down lines with A-down and A-up (also works in visual mode) {
  :nnoremap <S-down> :m+<CR>==
  :nnoremap <S-up> :m-2<CR>==
  :inoremap <S-down> <Esc>:m+<CR>==gi
  :inoremap <S-up> <Esc>:m-2<CR>==gi
  :vnoremap <S-down> :m'>+<CR>gv=gv
  :vnoremap <S-up> :m-2<CR>gv=gv
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
  if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif

  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

  " bind \ (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

  :map <C-f> :Ag -i<SPACE>
" }
