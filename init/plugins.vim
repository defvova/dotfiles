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

  " Nerdtree Plugin - A tree explorer plugin for vim.
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Customized vim status line
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Icons
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  " Find And Replace Vim plugin
  Plug 'brooth/far.vim'

  " Comment stuff out
  Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }

  " SuperTab - Perform all your vim insert mode completions with Tab
  Plug 'ervandew/supertab'

  " Vim plugin that displays tags in a window, ordered by scope
  Plug 'majutsushi/tagbar'

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

  " Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.
  Plug 'luochen1990/rainbow'

  " Vim plugin, insert or delete brackets, parens, quotes in pair
  Plug 'jiangmiao/auto-pairs'

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

  Plug 'chrisbra/Colorizer'

  " Display the import size of the JavaScript packages in Vim!
  Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }

  " Vim commands for Flutter, including hot-reload-on-save and more
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "  Highlighting                                                        "
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " Vim bundle for styled-components, diet-cola, emotion, experimental glamor/styled, and astroturf content in javascript files.
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  " vim-tsx will do all the coloring for jsx in the .tsx file
  Plug 'ianks/vim-tsx'

  " A Vim plugin that always highlights the enclosing html/xml tags
  Plug 'Valloric/MatchTagAlways'

  " Improved syntax highlighting and indentation
  Plug 'othree/yajs.vim'

  " Typescript syntax highlighting
  Plug 'leafgarland/typescript-vim'

  " ReactJS JSX syntax highlighting
  Plug 'mxw/vim-jsx'

  " Improved nginx vim plugin (incl. syntax highlighting)
  Plug 'chr4/nginx.vim'

  " Syntax highlighting for javascript libraries
  Plug 'othree/javascript-libraries-syntax.vim'
call plug#end()
