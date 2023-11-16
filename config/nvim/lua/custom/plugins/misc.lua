return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup {
        manual_mode = true,
        detection_methods = { "pattern", "lsp" },
        patterns = { ".git" },
      }
    end,
  },
  {
    "chentoast/marks.nvim",
    cmd = { "MarksListAll", "MarksListBuf" },
    config = function()
      require("marks").setup {
        excluded_filetypes = { "gitcommit" },
      }
    end,
  },
  {
    "Darazaki/indent-o-matic",
    event = "VeryLazy",
    config = true,
  },
  {
    "jghauser/fold-cycle.nvim",
    config = true,
    keys = {
      {
        "<BS>",
        function()
          require("fold-cycle").open()
        end,
        desc = "fold-cycle: toggle",
      },
    },
  },
  {
    "andrewferrier/debugprint.nvim",
    opts = { create_keymaps = false },
    keys = {
      {
        "<leader>dp",
        function()
          return require("debugprint").debugprint { variable = true }
        end,
        desc = "debugprint: cursor",
        expr = true,
      },
      {
        "<leader>do",
        function()
          return require("debugprint").debugprint { motion = true }
        end,
        desc = "debugprint: operator",
        expr = true,
      },
      { "<leader>dC", "<Cmd>DeleteDebugPrints<CR>", desc = "debugprint: clear all" },
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
    lazy = false,
    -- event = "VeryLazy",
    config = true,
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

  { "MTDL9/vim-log-highlighting", event = "VeryLazy" },
  -- Detect tabstop and shiftwidth automatically
  { "tpope/vim-sleuth", event = "VeryLazy" },
  { "tpope/vim-repeat", event = "VeryLazy" },

  -- library used by other plugins
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-tree/nvim-web-devicons",
    -- lazy = false,
    -- dependencies = { "DaikyXendo/nvim-material-icon" },
    -- config = function()
    --   require("nvim-web-devicons").setup {
    --     override = require("nvim-material-icon").get_icons(),
    --     color_icons = true,
    --   }
    -- end,
  },
  { "MunifTanjim/nui.nvim" },
  { "nvim-lua/popup.nvim" },
}
