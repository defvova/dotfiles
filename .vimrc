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

" required! {
  Plugin 'VundleVim/Vundle.vim'
" }

" My Bundles here {
    Plugin 'vim-scripts/endwise.vim'
    Plugin 'Raimondi/delimitMate'
    Plugin 'Townk/vim-autoclose'
    Plugin 'vim-scripts/matchit.zip'
    Plugin 'vim-scripts/ragtag.vim'
    Plugin 'amirh/HTML-AutoCloseTag'
  " Syntax highlight {
    Plugin 'briancollins/vim-jst'
    Plugin 'mxw/vim-jsx'
    Plugin 'slim-template/vim-slim'
    Plugin 'cucumber.zip'
    Plugin 'gmarik/vim-markdown'
    Plugin 'timcharper/textile.vim'
    Plugin 'avakhov/vim-yaml'
    Plugin 'vim-less'
    Plugin 'tpope/vim-haml'
    Plugin 'pangloss/vim-javascript'
    Plugin 'kchmck/vim-coffee-script.git'
    Plugin 'JulesWang/css.vim'
    Plugin 'cakebaker/scss-syntax.vim'
    Plugin 'othree/html5-syntax.vim'
    Plugin 'othree/html5.vim'
  " }

  " JShint {
    Plugin 'wookiehangover/jshint.vim'

    let JSHintUpdateWriteOnly=1
  " }

  " Simple color selector/picker {
    Plugin 'KabbAmine/vCoolor.vim'
  " }

  " Devicons {
    Plugin 'ryanoasis/vim-devicons'

    let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
  " }

  " Auto Pairs {
    Plugin 'jiangmiao/auto-pairs'
  " }

  " Statusline {
    Plugin 'bling/vim-airline'

    let g:Powerline_symbols = 'fancy'
    let g:airline_powerline_fonts=1
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#hunks#enabled=0
    let g:airline#extensions#branch#enabled=1
  " }

  " Colorscheme {
    Plugin 'flazz/vim-colorschemes'
  " }

  " Autocomplete words {
    " Plugin 'exvim/ex-autocomplpop'
  " }

  " Multiple cursors {
    Plugin 'vim-multiple-cursors'
  " }

  " RSpec {
    Plugin 'thoughtbot/vim-rspec'

    map <Leader>t :call RunCurrentSpecFile()<CR>
    map <Leader>s :call RunNearestSpec()<CR>
    map <Leader>l :call RunLastSpec()<CR>
    map <Leader>a :call RunAllSpecs()<CR>
  " }

  " Comments {
    Plugin 'tcomment'

    map <C-c> <esc>gcc<end>
    vmap <C-c> gc
  " }

  " Surround {
    Plugin 'tpope/vim-surround'
  " }

  " Bufexplorer {
    Plugin 'jlanzarotta/bufexplorer'

    nnoremap <silent> <C-b> :BufExplorer<CR>
  " }

  " Rgrep {
    " Plugin 'vim-scripts/grep.vim'
    "
    " :map <C-f> :Rgrep<cr>
    " let Grep_Skip_Files = '*.log *.sql *.png *.jpg *.jpeg *.gif'
    " let Grep_Skip_Dirs = 'tmp system coverage log solr public'
  " }

  " Syntastic {
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
  " }

  " Command-T {
    Plugin 'wincent/Command-T.git'

    set wildignore+=*.sql,*.log,*.git
    :map <A-S-i> :CommandT<cr>
    nnoremap <silent> <tab> :CommandT<CR>
    let g:CommandTCursorRightMap=['<C-r>']
    let g:CommandTAcceptSelectionTabMap=['<C-l>']
    let g:CommandTMatchWindowAtTop=1
    let g:CommandTWildIgnore=&wildignore . ",**/tmp/*"
    map <F9> :CommandTFlush<cr>
  " }

  " Nerdtree plugin {
    Plugin 'scrooloose/nerdtree'

    :map <F2> :NERDTreeToggle<cr>
    :let NERDTreeIgnore=['\.pys$'] " Don't show pyc files
    :let NERDTreeChDirMode=0
    :let NERDTreeQuitOnOpen=1
  " }

  " Rails {
    Plugin 'tpope/vim-rails'

    :map mv :Eview<cr>
    :map mc :Econtroller<cr>
    :map mm :Emodel<cr>
    :map mh :Ehelper<cr>
    :map mj :Ejavascript<CR>
    :map ms :Estylesheet<CR>
  " }

  " Snippets {
    Plugin 'gmarik/snipmate.vim'

    nnoremap ,smr <esc>:exec ReloadAllSnippets()<cr>
  " }

  " All of your Plugins must be added before the following line {
    filetype indent on                " required! Turn on file type detection.
    call vundle#end()                 " required!
  " }

" }

" VIM Ui {
  colorscheme hybrid
  set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h13
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
  filetype off                      " !include
  filetype plugin indent on         " Automatically detect file types.
  syntax on                         " syntax highlighting

  autocmd BufWritePre *.* :%s/\s\+$//e " Delete all trailing whitespace
  autocmd BufNewFile,BufRead *.html.erb set ft=eruby.html
  au Bufread,BufNewFile *.feature set filetype=gherkin
  au! Syntax gherkin source ~/.vim/cucumber.vim

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
  autocmd! bufwritepost .vimrc source %
  set autoread " autorealod changed files
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

  :map <C-f> :Ag<SPACE>
" }
