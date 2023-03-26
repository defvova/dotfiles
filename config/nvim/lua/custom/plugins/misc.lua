return {
  {
    "dinhhuy258/git.nvim",
    -- event = "VeryLazy",
    -- cmd = { "Git", "GitBlame", "GitDiff", "GitDiffClose", "GitCreatePullRequest", "GitRevert", "GitRevertFile" },
    keys = {
      {
        "<leader>gb",
        "<CMD>lua require('git.blame').blame()<CR>",
        desc = "[G]it [B]lame",
      },
    },
    opts = {
      default_mappings = false,
    },
  },
  { "gennaro-tedesco/nvim-jqx", cmd = { "JqxQuery", "JqxList" } },
  {
    "numToStr/Comment.nvim",
    keys = {
      {
        "gcc",
        function()
          require("Comment.api").toggle.linewise.current()
        end,
        desc = "Toggle Comment",
      },
      {
        "gc",
        "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        desc = "Toggle Comment",
        mode = "v",
      },
    },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        mappings = {
          basic = false,
          extra = false,
        },
      }
    end,
  },
  {
    "chrisbra/csv.vim",
    ft = "csv",
  },
  {
    "ruifm/gitlinker.nvim",
    keys = {
      {
        "<leader>gL",
        function()
          -- require("gitlinker.actions").copy_to_clipboard()
          require("gitlinker").get_buf_range_url(
            "n",
            { action_callback = require("gitlinker.actions").open_in_browser }
          )
        end,
        desc = "[G]it open [L]ine in browser",
      },
      {
        "<leader>gL",
        function()
          -- require("gitlinker.actions").copy_to_clipboard()
          require("gitlinker").get_buf_range_url(
            "v",
            { action_callback = require("gitlinker.actions").open_in_browser }
          )
        end,
        desc = "[G]it open [L]ine in browser",
        mode = "v",
      },
      {
        "<leader>gR",
        function()
          require("gitlinker").get_repo_url { action_callback = require("gitlinker.actions").open_in_browser }
        end,
        desc = "[G]it open [R]epo in browser",
      },
    },
  },
  {
    "mg979/vim-visual-multi",
    keys = {
      "<C-n>",
      { "<C-Up>", mode = "i" },
      { "<C-Down>", mode = "i" },
    },
  },
  -- {
  --   "chaoren/vim-wordmotion",
  --   event = "VeryLazy",
  -- },
  -- {
  --   "phaazon/hop.nvim",
  --   name = "hop",
  --   keys = {
  --     { "f", "<cmd> HopWord<CR>", desc = "hop word", mode = { "n", "x", "v" } },
  --   },
  --   cmd = {
  --     "HopWord",
  --     "HopChar1",
  --   },
  --   config = true,
  -- },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    config = true,
    keys = {
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "[S]earch Todo ([T]rouble)" },
    },
  },
  {
    "zbirenbaum/neodim",
    -- event = "BufReadPre",
    event = "LspAttach",
    config = true,
  },
  {
    "ur4ltz/surround.nvim",
    keys = { { "s", mode = { "v", "x" } } },
    opts = {
      mappings_style = "sandwich",
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
    keys = {
      { "<leader>so", "<cmd>SymbolsOutline<CR>", desc = "[S]ymbols [O]utline" },
    },
    config = true,
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
    keys = {
      { "<leader>os", "<cmd>SymbolsOutline<CR>", desc = "[O]pen [S]ymbols outline" },
    },
    config = true,
  },
  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "booperlv/nvim-gomove",
    keys = {
      -- { "<A-h>", mode = { "n", "x", "v" } },
      { "<A-j>", mode = { "n", "x", "v" } },
      { "<A-k>", mode = { "n", "x", "v" } },
      -- { "<A-l>", mode = { "n", "x", "v" } },
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
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascriptreact" },
    event = "InsertEnter",
  },
  -- {
  --   "mfussenegger/nvim-treehopper",
  --   keys = {
  --     {
  --       "m",
  --       ":<C-U>lua require('tsht').nodes()<CR>",
  --       desc = "Treehopper Visual",
  --       mode = { "v" },
  --       silent = true,
  --     },
  --     {
  --       "m",
  --       ":lua require('tsht').nodes()<CR>",
  --       mode = { "o" },
  --       desc = "Treehopper",
  --       silent = true,
  --     },
  --   },
  -- },

  -- Detect tabstop and shiftwidth automatically
  { "tpope/vim-sleuth", event = "VeryLazy" },
  { "tpope/vim-repeat", event = "VeryLazy" },

  -- library used by other plugins
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "MunifTanjim/nui.nvim" },
  { "nvim-lua/popup.nvim" },
}
