""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  VIM UI                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add custom highlights in method that is executed every time a colorscheme is sourced
" See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f for details
function! MyHighlights() abort
  " Hightlight trailing whitespace
  highlight Trail ctermbg=red guibg=red
  call matchadd('Trail', '\s\+$', 100)
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme * call MyHighlights()
augroup END

augroup vimrc
  " Reset the vimrc augroup. Autocommands are added to this group throughout the file
  autocmd!

  " Automatically delete trailing DOS-returns and whitespace on file open and write.
  autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//
augroup END

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" My favorite colors (palenight, OceanicNext, hybrid, github, mac_classic, desert, onedark)
try
  colorscheme palenight
catch
  colorscheme slate
endtry

filetype indent off

" Don't show last command
set noshowcmd

" Yank and paste with the system clipboard
set clipboard=unnamed

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" Only one line for command line
set cmdheight=1

" Enable true color support
set termguicolors

" Editor theme
set background=dark " dark|light

" Change the terminal's title
set title

" Removes left hand scroll bar
set guioptions-=L

" Removes top toolbar
set guioptions-=T

" Removes right hand scroll bar
set guioptions-=r

" Enable line number
set number

" Insert spaces when TAB is pressed.
set expandtab ts=2 sw=2 ai

" Always shows tabs on top
set showtabline=2

" Highlight matches.
set hlsearch

" show matching bracket (briefly jump)
set showmatch

" No beeping.
set visualbell
set novisualbell

" Don't make a backup before overwriting a file.
set nobackup
" And again.
set nowritebackup
" Disable swp files
set noswapfile

" Remove the buffer after tab close
set nohidden

" automatically enable mouse usage
set mouse=a

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler

" use the listchars settings
set list

" show space
set listchars=trail:•

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" case insensitive search
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

set shellslash
set colorcolumn=80

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" always show signcolumns
set signcolumn=yes

let g:quantum_italics = 1

" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

" Disable splash text
" set shortmess+=I
"
" Disable intro message
" set shortmess=filmnrxtTI
"
" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c
set shortmess-=F

set tags=./tags

" coc.nvim color changes
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

" Make background transparent for many things
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! LineNr ctermfg=NONE guibg=NONE
hi! SignColumn ctermfg=NONE guibg=NONE
hi! StatusLine guifg=#16252b guibg=#6699CC
hi! StatusLineNC guifg=#16252b guibg=#16252b

" Try to hide vertical spit and end of buffer symbol
hi! VertSplit gui=NONE guifg=#17252c guibg=#17252c
hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=#17252c guifg=#17252c

" Customize NERDTree directory
hi! NERDTreeCWD guifg=#99c794

" Make background color transparent for git changes
hi! SignifySignAdd guibg=NONE
hi! SignifySignDelete guibg=NONE
hi! SignifySignChange guibg=NONE

" Highlight git change signs
hi! SignifySignAdd guifg=#99c794
hi! SignifySignDelete guifg=#ec5f67
hi! SignifySignChange guifg=#c594c5

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of preview window when open
function! Handle_Win_Enter()
  if &previewwindow
    setlocal winhighlight=Normal:MarkdownError
  endif
endfunction

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" LSP plugin to start the analysis server
let g:lsc_auto_map = v:true
let g:lsc_enable_autocomplete = v:false
