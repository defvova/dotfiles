-- vim.cmd "packadd packer.nvim"

local plugins = {
  -- Speed up deffered plugins
  ["lewis6991/impatient.nvim"] = {},

  ["nvim-lua/plenary.nvim"] = { module = "plenary" },
  ["wbthomason/packer.nvim"] = {
    cmd = require("core.lazy_load").packer_cmds,
    config = function()
      require "plugins"
    end,
  },
  ["numToStr/Comment.nvim"] = {
    module = "Comment",
    keys = { "gc", "gb" },
    config = function()
      require "plugins.comment"
    end,
    setup = function()
      require("core.utils").load_mappings "comment"
    end,
  },
  ["windwp/nvim-autopairs"] = {
    after = "nvim-cmp",
    config = function()
      require "plugins.autopairs"
    end,
  },
  ["norcalli/nvim-colorizer.lua"] = {
    config = function()
      require "plugins.colorizer"
    end,
  },
  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    config = function()
      require "plugins.telescope"
    end,
    setup = function()
      require("core.utils").load_mappings "telescope"
    end,
  },
  ["lukas-reineke/indent-blankline.nvim"] = {
    config = function()
      require "plugins.blankline"
    end,
  },
  ["rafamadriz/friendly-snippets"] = {
    module = { "cmp", "cmp_nvim_lsp" },
    event = "InsertEnter",
    requires = {
      {
        "hrsh7th/nvim-cmp",
        -- opt = true,
        requires = {
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-path",
          "onsails/lspkind-nvim",
          "hrsh7th/cmp-nvim-lsp-document-symbol",
          "hrsh7th/cmp-cmdline",
          -- "ray-x/cmp-treesitter",
          -- "hrsh7th/cmp-emoji",
          -- "f3fora/cmp-spell",
          -- "hrsh7th/cmp-calc",
          -- "octaltree/cmp-look",
        },
      },
    },
    config = function()
      require "plugins.cmp"
    end,
  },

  ["L3MON4D3/LuaSnip"] = {
    wants = "friendly-snippets",
    after = "nvim-cmp",
    requires = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
    },
    config = function()
      require "plugins.luasnip"
    end,
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    module = "nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      "RRethy/nvim-treesitter-textsubjects",
      {
        "p00f/nvim-ts-rainbow",
        opt = false,
        event = { "CursorHold", "CursorHoldI" },
      },
    },
    config = function()
      require "plugins.treesitter"
    end,
  },
  ["kyazdani42/nvim-tree.lua"] = {
    ft = "alpha",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    setup = function()
      require("core.utils").load_mappings "nvimtree"
    end,
    config = function()
      require "plugins.nvimtree"
    end,
  },
  ["nvim-lualine/lualine.nvim"] = {
    requires = { "kyazdani42/nvim-web-devicons", "SmiteshP/nvim-navic" },
    config = function()
      require "plugins.lualine"
    end,
  },
  ["lewis6991/gitsigns.nvim"] = {
    config = function()
      require "plugins.gitsigns"
    end,
  },
  -- ["akinsho/bufferline.nvim"] = {
  --   tag = "v2.*",
  --   requires = "kyazdani42/nvim-web-devicons",
  --   config = function()
  --     require "plugins.bufferline"
  --   end,
  -- },
  ["nanozuki/tabby.nvim"] = {
    config = function()
      require "plugins.tabby"
    end,
  },
  ["folke/which-key.nvim"] = {},
  ["dinhhuy258/git.nvim"] = {
    config = function()
      require("git.config").setup()
    end,
  },
  ["nvim-neotest/neotest"] = {
    wants = {
      "plenary.nvim",
      "nvim-treesitter",
      "FixCursorHold.nvim",
      "neotest-rspec",
      "neotest-jest",
      "neotest-rust",
      "overseer.nvim",
    },
    requires = {
      "olimorris/neotest-rspec",
      "haydenmeade/neotest-jest",
      "rouge8/neotest-rust",
    },
    module = { "neotest", "neotest.async" },
    config = function()
      require "plugins.neotest"
    end,
  },
  ["gelguy/wilder.nvim"] = {
    config = function()
      require "plugins.wilder"
    end,
  },
  ["gennaro-tedesco/nvim-jqx"] = {},
  ["NTBBloodbath/rest.nvim"] = {
    requires = { "nvim-lua/plenary.nvim" },
    ft = "http",
    config = function()
      require("rest-nvim").setup()
    end,
  },
  ["luukvbaal/stabilize.nvim"] = {
    config = function()
      require("stabilize").setup()
    end,
  },
  ["ruifm/gitlinker.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require "plugins.gitlinker"
    end,
  },
  ["yamatsum/nvim-cursorline"] = {
    config = function()
      require "plugins.cursorline"
    end,
  },
  ["kkharji/lspsaga.nvim"] = {
    config = function()
      require "plugins.lspsaga"
    end,
  },
  ["j-hui/fidget.nvim"] = {
    event = "BufReadPre",
    config = function()
      require("fidget").setup {}
    end,
  },
  -- INFO: https://alpha2phi.medium.com/neovim-for-beginners-database-explorer-7db3d3910876
  -- ["tpope/vim-dadbod"] = {
  --   -- event = "VimEnter",
  --   opt = true,
  --   requires = { "kristijanhusak/vim-dadbod-ui", "kristijanhusak/vim-dadbod-completion", "tpope/vim-dotenv" },
  --   config = function()
  --     require "plugins.dadbod"
  --   end,
  --   cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
  -- },
  ["mg979/vim-visual-multi"] = {
    event = "BufReadPre",
  },
  ["abecodes/tabout.nvim"] = {
    opt = false,
    wants = { "nvim-treesitter" },
    after = { "nvim-cmp" },
    config = function()
      require("tabout").setup {
        completion = false,
        ignore_beginning = false,
      }
    end,
  },
  ["filipdutescu/renamer.nvim"] = {
    branch = "master",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require "plugins.renamer"
    end,
  },
  ["antoinemadec/FixCursorHold.nvim"] = {
    event = "BufReadPre",
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  },
  ["chaoren/vim-wordmotion"] = {},
  ["phaazon/hop.nvim"] = {
    event = "BufRead",
    keys = { "q" },
    as = "hop",
    cmd = {
      "HopWord",
      "HopChar1",
    },
    config = function()
      require("hop").setup()
    end,
  },
  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    config = function()
      require("plugins.smolconfigs").todo()
    end,
  },
  ["narutoxy/dim.lua"] = {
    requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
    config = function()
      require("dim").setup {}
    end,
  },
  -- FIXME: doesn't work
  -- ["vuki656/package-info.nvim"] = {
  --   opt = true,
  --   requires = "MunifTanjim/nui.nvim",
  --   wants = { "nui.nvim" },
  --   module = { "package-info" },
  --   ft = { "json" },
  --   config = function()
  --     require "plugins.package-info"
  --   end,
  -- },
  ["ur4ltz/surround.nvim"] = {
    event = "BufRead",
    config = function()
      require("plugins.smolconfigs").surround()
    end,
  },
  ["karb94/neoscroll.nvim"] = {
    event = "WinScrolled",
    keys = { "<C-u>", "<C-d>", "gg", "G" },
    config = function()
      require "plugins.neoscroll"
    end,
  },
  ["monaqa/dial.nvim"] = {
    config = function()
      require "plugins.dial"
    end,
  },
  ["nvim-telescope/telescope-project.nvim"] = {
    event = "BufWinEnter",
    after = { "telescope.nvim" },
    module = { "telescope-project", "telescope" },
    requires = { "nvim-telescope/telescope-file-browser.nvim" },
  },
  ["romgrk/nvim-treesitter-context"] = {
    config = function()
      require "plugins.tree-context"
    end,
  },
  ["stevearc/dressing.nvim"] = {
    config = function()
      require("plugins.smolconfigs").dressing()
    end,
  },
  ["saecki/crates.nvim"] = {
    event = { "BufRead Cargo.toml" },
    opt = false,
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("crates").setup {}
    end,
  },
  ["folke/persistence.nvim"] = {
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("plugins.smolconfigs").persistence()
    end,
  },
  ["ray-x/lsp_signature.nvim"] = {
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  ["andymass/vim-matchup"] = {
    opt = false,
    event = { "CursorMoved", "CursorMovedI" },
    config = function()
      require("plugins.smolconfigs").matchup()
    end,
  },
  ["nathom/filetype.nvim"] = {
    -- event = {'BufEnter'},
    setup = function()
      vim.g.did_load_filetypes = 1
    end,
  },
  ["simrat39/symbols-outline.nvim"] = {
    opt = false,
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
    config = function()
      require("symbols-outline").setup {}
    end,
  },
  ["JoosepAlviste/nvim-ts-context-commentstring"] = {
    event = "BufReadPost",
    opt = false,
  },
  ["m-demare/hlargs.nvim"] = {
    opt = false,
    after = "nvim-treesitter",
    config = function()
      require("hlargs").setup()
    end,
  },
  ["folke/trouble.nvim"] = {
    event = "BufReadPre",
    cmd = { "Trouble", "TroubleToggle" },
    module = "trouble",
    config = function()
      require("plugins.smolconfigs").trouble()
    end,
  },
  ["EdenEast/nightfox.nvim"] = {
    run = ":NightfoxCompile",
    config = function()
      require "plugins.theme"
    end,
  },
  ["booperlv/nvim-gomove"] = {
    event = { "CursorMoved", "CursorMovedI" },
    config = function()
      require "plugins.gomove"
    end,
  },
  ["dstein64/vim-startuptime"] = {
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  ["RRethy/nvim-treesitter-endwise"] = {
    event = "InsertEnter",
    ft = { "ruby", "lua" },
    after = "nvim-treesitter",
  },
  ["windwp/nvim-spectre"] = {
    event = "BufRead",
    opt = false,
    module = "spectre",
    wants = { "plenary.nvim", "popup.nvim" },
    keys = { "<leader>sf", "<leader>sF" },
    requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require "plugins.spectre"
    end,
  },
  ["kevinhwang91/nvim-bqf"] = {
    event = { "CmdlineEnter", "QuickfixCmdPre" },
    -- ft = "qf",
    opt = false,
    requires = { "junegunn/fzf", opt = false },
    config = function()
      require "plugins.nvim-bqf"
    end,
    run = function()
      vim.fn["fzf#install"]()
    end,
  },
  ["nacro90/numb.nvim"] = {
    event = "BufRead",
    config = function()
      require "plugins.numb"
    end,
  },
  ["windwp/nvim-ts-autotag"] = {
    event = "InsertEnter",
    opt = false,
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("plugins.smolconfigs").autotag()
    end,
  },
  ["nvim-treesitter/playground"] = {
    opt = false,
    cmd = { "TSCaptureUnderCursor", "TSPlaygroundToggle" },
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },
  -- ["nvim-neorg/neorg"] = {
  --   ft = "norg",
  --   after = "nvim-treesitter",
  --   config = function()
  --     require "plugins.neorg"
  --   end,
  --   requires = { "nvim-neorg/neorg-telescope", ft = { "norg" } },
  -- },
  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function()
      require "plugins.alpha"
    end,
  },
  ["anuvyklack/fold-preview.nvim"] = {
    -- event = "BufRead",
    requires = "anuvyklack/keymap-amend.nvim",
    config = function()
      require "plugins.pretty-fold"
    end,
  },
  ["neovim/nvim-lspconfig"] = {
    after = "cmp-nvim-lsp",
    wants = {
      "mason.nvim",
      "mason-lspconfig.nvim",
      "mason-tool-installer.nvim",
    },
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "princejoogie/tailwind-highlight.nvim",
      { "b0o/schemastore.nvim", module = "schemastore" },
      {
        "mhartington/formatter.nvim",
        config = function()
          require "plugins.formatter"
        end,
      },
      {
        "jose-elias-alvarez/typescript.nvim",
        module = "typescript",
      },
      {
        "folke/lua-dev.nvim",
        ft = "lua",
        opt = false,
        module = "lua-dev",
      },
      {
        "simrat39/rust-tools.nvim",
        requires = {
          "mattn/webapi-vim",
          "felipec/vim-sanegx",
          "rust-lang/rust.vim",
          "nvim-lua/plenary.nvim",
          {
            "rcarriga/nvim-dap-ui",
            requires = { "mfussenegger/nvim-dap" },
          },
        },
      },
    },
    config = function()
      require "plugins.lspconfig"
      require "plugins.dap"
    end,
  },
  ["folke/which-key.nvim"] = {
    module = "which-key",
    keys = "<leader>",
    config = function()
      require "plugins.whichkey"
    end,
    setup = function()
      require("core.utils").load_mappings "whichkey"
    end,
  },
  ["mfussenegger/nvim-ts-hint-textobject"] = {
    config = function()
      vim.cmd [[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
      vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
    end,
  },
  ["stevearc/overseer.nvim"] = {
    opt = true,
    cmd = {
      "OverseerToggle",
      "OverseerOpen",
      "OverseerRun",
      "OverseerBuild",
      "OverseerClose",
      "OverseerLoadBundle",
      "OverseerSaveBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerQuickAction",
      "OverseerTaskAction",
    },
    config = function()
      require("overseer").setup()
    end,
  },
  ["rktjmp/lush.nvim"] = {},
  ["akinsho/toggleterm.nvim"] = {
    tag = "v2.*",
    config = function()
      require "plugins.toggleterm"
      require "plugins.lazygit"
    end,
  },
  -- ["bennypowers/nvim-regexplainer"] = {
  --   config = function()
  --     require "plugins.regexplainer"
  --   end,
  --   requires = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "MunifTanjim/nui.nvim",
  --   },
  -- },
}

require("core.packer").run(plugins)
