return {
  { "nvim-tree/nvim-web-devicons" },
  {
    "dinhhuy258/git.nvim",
    config = function()
      require("git.config").setup()
    end,
  },
  { "gennaro-tedesco/nvim-jqx", cmd = { "JqxQuery", "JqxList" } },
  {
    "ruifm/gitlinker.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "mg979/vim-visual-multi",
    event = "BufReadPre",
  },
  {
    "filipdutescu/renamer.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("renamer").setup()
    end,
  },
  {
    "chaoren/vim-wordmotion",
    event = "BufReadPre",
  },
  {
    "phaazon/hop.nvim",
    name = "hop",
    cmd = {
      "HopWord",
      "HopChar1",
    },
    config = function()
      require("hop").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    cmd = { "TodoTrouble", "TodoTelescope" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "narutoxy/dim.lua",
    event = "BufReadPre",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("dim").setup {}
    end,
  },
  {
    "ur4ltz/surround.nvim",
    event = "BufRead",
    config = function()
      require("surround").setup { mappings_style = "sandwich" }
    end,
  },
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("crates").setup {}
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      local persistence = require "persistence"
      persistence.setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "andymass/vim-matchup",
    event = { "CursorMoved", "CursorMovedI" },
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "nathom/filetype.nvim",
    lazy = false,
    init = function()
      vim.g.did_load_filetypes = 1
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
    config = function()
      require("symbols-outline").setup {}
    end,
  },
  {
    "m-demare/hlargs.nvim",
    event = "BufRead",
    config = function()
      require("hlargs").setup()
    end,
  },
  {
    "booperlv/nvim-gomove",
    event = { "CursorMoved", "CursorMovedI" },
    config = function()
      require("gomove").setup()
    end,
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "RRethy/nvim-treesitter-endwise",
    event = "InsertEnter",
    ft = { "ruby", "lua" },
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    ft = { "html", "javascriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- {
  --   "nvim-treesitter/playground",
  --   cmd = { "TSCaptureUnderCursor", "TSPlaygroundToggle" },
  --   config = function()
  --     require("nvim-treesitter.configs").setup()
  --   end,
  -- }
  {
    "anuvyklack/fold-preview.nvim",
    event = "VeryLazy",
    dependencies = "anuvyklack/keymap-amend.nvim",
    config = function()
      require("fold-preview").setup()
    end,
  },
  {
    "mfussenegger/nvim-ts-hint-textobject",
    config = function()
      vim.cmd [[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
      vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
    end,
  },
}
