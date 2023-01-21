return {
  {
    "dinhhuy258/git.nvim",
    -- cmd = { "Git", "GitBlame", "GitDiff", "GitDiffClose", "GitCreatePullRequest", "GitRevert", "GitRevertFile" },
    config = true,
  },
  { "gennaro-tedesco/nvim-jqx", cmd = { "JqxQuery", "JqxList" } },
  {
    "ruifm/gitlinker.nvim",
    keys = {
      "<leader>gY",
      "<leader>gB",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "mg979/vim-visual-multi",
    keys = {
      "<C-n>",
      "<C-Up>",
      "<C-Down>",
    },
  },
  -- {
  --   "filipdutescu/renamer.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   config = function()
  --     require("renamer").setup()
  --   end,
  -- },
  {
    "chaoren/vim-wordmotion",
    event = "VeryLazy",
  },
  {
    "phaazon/hop.nvim",
    name = "hop",
    keys = { "f" },
    cmd = {
      "HopWord",
      "HopChar1",
    },
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    cmd = { "TodoTrouble", "TodoTelescope" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },
  {
    "narutoxy/dim.lua",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
    },
    config = true,
  },
  {
    "ur4ltz/surround.nvim",
    event = "VeryLazy",
    opts = {
      mappings_style = "sandwich",
    },
  },
  {
    "saecki/crates.nvim",
    event = { "BufReadPre Cargo.toml" },
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
      options = { "buffers", "curdir", "tabpages", "winsize" },
    },
  },
  {
    "andymass/vim-matchup",
    event = "VeryLazy",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
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
    event = "VeryLazy",
    config = true,
  },
  {
    "booperlv/nvim-gomove",
    keys = {
      "<A-h>",
      "<A-j>",
      "<A-k>",
      "<A-l>",
    },
    config = true,
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
    event = "VeryLazy",
    opts = {
      show_numbers = true, -- Enable 'number' for the window while peeking
      show_cursorline = true, -- Enable 'cursorline' for the window while peeking
    },
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascriptreact" },
    event = "InsertEnter",
  },
  -- {
  --   "nvim-treesitter/playground",
  --   cmd = { "TSCaptureUnderCursor", "TSPlaygroundToggle" },
  --   config = function()
  --     require("nvim-treesitter.configs").setup()
  --   end,
  -- }
  {
    "mfussenegger/nvim-treehopper",
    keys = {
      {
        "m",
        ":<C-U>lua require('tsht').nodes()<CR>",
        desc = "Treehopper Visual",
        mode = { "v" },
        silent = true,
      },
      {
        "m",
        ":lua require('tsht').nodes()<CR>",
        mode = { "o" },
        desc = "Treehopper",
        silent = true,
      },
    },
  },
}
