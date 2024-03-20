return {
  {
    'dmmulroy/ts-error-translator.nvim',
    ft = { 'js', 'jsx', 'ts', 'tsx' },
    event = "VeryLazy",
    config = true
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      {
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { "n", "o", "x" },
      },
    },
    config = true
  },
  {
    "Darazaki/indent-o-matic",
    event = "VeryLazy",
    lazy = false,
    config = true,
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
  { "gennaro-tedesco/nvim-jqx",   cmd = { "JqxQuery", "JqxList" } },
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
      { "<C-Up>",   mode = "i" },
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
    init = function()
      require("legendary").keymaps({
        { "<leader>xt", "<cmd>TodoTrouble<cr>",   description = "Todo comments (Trouble)" },
        { "<Leader>xT", "<cmd>TodoTelescope<CR>", description = "Todo comments (Telescope)" },
      })
    end,
  },
  {
    "zbirenbaum/neodim",
    -- event = "BufReadPre",
    enabled = function()
      return vim.fn.has("nvim-0.10.0") == 1
    end,
    event = "LspAttach",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  -- {
  --   "andymass/vim-matchup",
  --   -- event = "VeryLazy",
  --   lazy = false,
  --   config = function()
  --     vim.g.matchup_matchparen_deferred = 1   -- work async
  --     vim.g.matchup_matchparen_offscreen = {} -- disable status bar icon
  --   end,
  -- },
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
      { "<A-j>", mode = { "n", "x", "v" } },
      { "<A-k>", mode = { "n", "x", "v" } },
    },
    config = function()
      require("gomove").setup({
        map_defaults = false
      })

      local map = require("gomove.mappings").map
      map({
        { "n", "<A-j>", "<Plug>GoNSMDown", {} },
        { "n", "<A-k>", "<Plug>GoNSMUp",   {} },
        { "x", "<A-j>", "<Plug>GoVSMDown", {} },
        { "x", "<A-k>", "<Plug>GoVSMUp",   {} },
        { "n", "<A-J>", "<Plug>GoNSDDown", {} },
        { "n", "<A-K>", "<Plug>GoNSDUp",   {} },
        { "x", "<A-J>", "<Plug>GoVSDDown", {} },
        { "x", "<A-K>", "<Plug>GoVSDUp",   {} },
      })
    end
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "nacro90/numb.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {
      show_numbers = true,    -- Enable 'number' for the window while peeking
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
  { "tpope/vim-sleuth",           event = "VeryLazy" },
  { "tpope/vim-repeat",           event = "VeryLazy" },

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
