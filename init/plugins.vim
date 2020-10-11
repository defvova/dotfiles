" Automatic installation VimPlug
" Place the following code before plug#begin()
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  if executable('curl')
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
    if v:shell_error
      echom "Error downloading vim-plug. Please install it manually.\n"
      exit
    endif
  else
    echom "vim-plug not installed. Please install it manually or install curl.\n"
    exit
  endif
endif

call plug#begin('~/.config/nvim/plugged')
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "  List of plugins                                                     "
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Make sure you use single quotes
  "
  " These need to come before the configuration options for the plugins since
  " VimPlug will add the plugin folders to the runtimepath only after it has seen the plugin's Plugin command.

  " Wisely add 'end' in ruby, endfunction/endif/more in vim script, etc.
  Plug 'tpope/vim-endwise'

  " Lightweight support for Ruby's Bundler. Go to gemfile then :Bopen rails
  Plug 'tpope/vim-bundler'

  " Rails - Ruby on Rails power tools
  Plug 'tpope/vim-rails'

  " Improved motion in Vim
  Plug 'easymotion/vim-easymotion'

  " Intellisense code engine, auto-completion, linting, code fixing
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

  " A command-line fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " UltiSnips - The ultimate snippet solution for Vim
  Plug 'SirVer/ultisnips'

  " Snippets are separated from the engine.
  Plug 'honza/vim-snippets'
  Plug 'mlaursen/vim-react-snippets'

  " Gitk - a Git wrapper so awesome, it should be illegal.
  " Example, :GV, :GV!, :Gbrowse
  Plug 'tpope/vim-fugitive' | Plug 'junegunn/gv.vim' | Plug 'tpope/vim-rhubarb'

  " A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks.
  Plug 'airblade/vim-gitgutter'

  " Customized vim status line
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Icons
  Plug 'ryanoasis/vim-devicons'

  " Comment stuff out
  Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }

  " SuperTab - Perform all your vim insert mode completions with Tab
  Plug 'ervandew/supertab'

  " Viewer & Finder for LSP symbols and tags
  Plug 'liuchengxu/vista.vim'

  " Asynchronous Lint Engine
  Plug 'w0rp/ale'

  " The fancy start screen for Vim.
  Plug 'mhinz/vim-startify'

  Plug 'rizzatti/dash.vim'

  " Colorscheme - one colorscheme pack to rule them all!
  Plug 'flazz/vim-colorschemes'

  " Colorschemes for Vim
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'rakr/vim-one'

  " The open source plugin for productivity metrics, goals, leaderboards, and automatic time tracking.
  Plug 'wakatime/vim-wakatime'
  Plug 'https://gitlab.com/code-stats/code-stats-vim.git'

  " Plugin highlighting word under cursor and all of its occurrences.
  Plug 'dominikduda/vim_current_word'

  " Vim plugin, insert or delete brackets, parens, quotes in pair
  " Plug 'jiangmiao/auto-pairs'
  Plug 'cohama/lexima.vim'
  " Plug 'Raimondi/delimitMate'

  " Like Rails.vim for Node
  Plug 'moll/vim-node'

  " A Vim plugin that manages your tag files
  Plug 'ludovicchabant/vim-gutentags'

  " Auto close html tags
  Plug 'alvan/vim-closetag'

  " The plugin provides mappings to easily delete, change and add such surroundings in pairs.
  Plug 'machakann/vim-sandwich'

  " The interactive scratchpad for hackers.
  Plug 'metakirby5/codi.vim'

  Plug 'norcalli/nvim-colorizer.lua'

  " Display the import size of the JavaScript packages in Vim!
  Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }

  " Vim commands for Flutter, including hot-reload-on-save and more
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'natebosch/vim-lsc'
  Plug 'natebosch/vim-lsc-dart'

  " Ranger integration in vim and neovim
  " Plug 'francoiscabrol/ranger.vim' | Plug 'rbgrouleff/bclose.vim'
  Plug 'mcchrish/nnn.vim' " it's better then ranger

  " A Vim Automatic Window Resizing Plugin
  Plug 'camspiers/animate.vim'
  Plug 'camspiers/lens.vim'

  " Vim plugin that shows keybindings in popup
  Plug 'liuchengxu/vim-which-key'

  " Use with nvim/vim's builtin terminal in the floating/popup window
  Plug 'voldikss/vim-floaterm'

  " Dadbod is a Vim plugin for interacting with databases.
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'

  Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}

  " Multi cursor
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "  Highlighting                                                        "
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " Vim bundle for styled-components, diet-cola, emotion, experimental glamor/styled, and astroturf content in javascript files.
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  " A Vim plugin that always highlights the enclosing html/xml tags
  Plug 'Valloric/MatchTagAlways'

  " Improved syntax highlighting and indentation
  " Plug 'othree/yajs.vim'

  " Typescript syntax highlighting
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  " ReactJS JSX syntax highlighting
  Plug 'maxmellon/vim-jsx-pretty'

  " Improved nginx vim plugin (incl. syntax highlighting)
  Plug 'chr4/nginx.vim'

  " Syntax highlighting for javascript libraries
  Plug 'othree/javascript-libraries-syntax.vim'
call plug#end()
