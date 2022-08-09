return {
  ["folke/which-key.nvim"] = {
    disable = false,
  },
  ["numToStr/FTerm.nvim"] = {
    config = function()
      require "custom.plugins.fterm"
      require "custom.plugins.lazygit"
    end,
  },
  ["nvim-neotest/neotest"] = {
    requires = {
      "olimorris/neotest-rspec",
      "haydenmeade/neotest-jest",
      "rouge8/neotest-rust",
    },
    config = function()
      require("neotest").setup {
        status = {
          virtual_text = true,
        },
        strategies = {
          integrated = {
            width = 180,
          },
        },
        adapters = {
          require "neotest-rspec",
          require "neotest-jest",
          require "neotest-rust",
        },
      }
    end,
  },
  ["gelguy/wilder.nvim"] = {
    config = function()
      require "custom.plugins.wilder"
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
      require "custom.plugins.gitlinker"
    end,
  },
  ["yamatsum/nvim-cursorline"] = {
    config = function()
      require "custom.plugins.cursorline"
    end,
  },
  ["kkharji/lspsaga.nvim"] = {
    config = function()
      require "custom.plugins.lspsaga"
    end,
  },
  -- FIXME: will work in nvim 0.8
  -- ["fgheng/winbar.nvim"] = {
  --   config = function()
  --     require("winbar").setup()
  --   end,
  -- },
  ["b0o/incline.nvim"] = {
    config = function()
      require("incline").setup()
    end,
  },
  ["j-hui/fidget.nvim"] = {
    event = "BufReadPre",
    config = function()
      require("fidget").setup {}
    end,
  },
  -- ["tpope/vim-dadbod"] = {
  --   event = "VimEnter",
  --   requires = { "kristijanhusak/vim-dadbod-ui", "kristijanhusak/vim-dadbod-completion", "tpope/vim-dotenv" },
  --   config = function()
  --     require "custom.plugins.dadbod"
  --   end,
  -- },
  ["mg979/vim-visual-multi"] = {
    event = "BufReadPre",
  },
  ["abecodes/tabout.nvim"] = {
    opt = true,
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
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require "custom.plugins.renamer"
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
      require("custom.plugins.smolconfigs").todo()
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
  --     require "custom.plugins.package-info"
  --   end,
  -- },
  -- ["lewis6991/impatient.nvim"] = {},
  ["ur4ltz/surround.nvim"] = {
    event = "BufRead",
    config = function()
      require("custom.plugins.smolconfigs").surround()
    end,
  },
  ["karb94/neoscroll.nvim"] = {
    event = "WinScrolled",
    keys = { "<C-u>", "<C-d>", "gg", "G" },
    config = function()
      require "custom.plugins.neoscroll"
    end,
  },
  ["monaqa/dial.nvim"] = {
    config = function()
      require "custom.plugins.dial"
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
      require "custom.plugins.tree-context"
    end,
  },
  ["stevearc/dressing.nvim"] = {
    config = function()
      require("custom.plugins.smolconfigs").dressing()
    end,
  },
  ["saecki/crates.nvim"] = {
    -- event = { "BufRead Cargo.toml" },
    ft = "toml",
    opt = true,
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("crates").setup {}
    end,
  },
  ["folke/persistence.nvim"] = {
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("custom.plugins.smolconfigs").persistence()
    end,
  },
  ["ray-x/lsp_signature.nvim"] = {
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  ["andymass/vim-matchup"] = {
    opt = true,
    event = { "CursorMoved", "CursorMovedI" },
    config = function()
      require("custom.plugins.smolconfigs").matchup()
    end,
  },
  ["nathom/filetype.nvim"] = {
    -- event = {'BufEnter'},
    setup = function()
      vim.g.did_load_filetypes = 1
    end,
  },
  ["simrat39/symbols-outline.nvim"] = {
    opt = true,
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
    config = function()
      require("symbols-outline").setup {}
    end,
  },
  ["JoosepAlviste/nvim-ts-context-commentstring"] = {
    event = "BufReadPost",
    opt = true,
  },
  ["m-demare/hlargs.nvim"] = {
    opt = true,
    after = "nvim-treesitter",
    config = function()
      require("hlargs").setup()
    end,
  },
  ["p00f/nvim-ts-rainbow"] = {
    opt = true,
    after = "nvim-treesitter",
    event = { "CursorHold", "CursorHoldI" },
  },
  ["folke/trouble.nvim"] = {
    event = "BufReadPre",
    cmd = { "Trouble", "TroubleToggle" },
    module = "trouble",
    config = function()
      require("custom.plugins.smolconfigs").trouble()
    end,
  },
  -- ["catppuccin/nvim"] = {
  --   opt = true,
  --   as = "catppuccin",
  --   config = function()
  --     require "custom.plugins.cat"
  --   end,
  -- },
  ["booperlv/nvim-gomove"] = {
    event = { "CursorMoved", "CursorMovedI" },
    config = function()
      require "custom.plugins.gomove"
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
    opt = true,
    module = "spectre",
    wants = { "plenary.nvim", "popup.nvim" },
    keys = { "<leader>sf", "<leader>sF" },
    requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require "custom.plugins.spectre"
    end,
  },
  ["kevinhwang91/nvim-bqf"] = {
    event = { "CmdlineEnter", "QuickfixCmdPre" },
    -- ft = "qf",
    opt = true,
    requires = { "junegunn/fzf", opt = true },
    config = function()
      require "custom.plugins.nvim-bqf"
    end,
    run = function()
      vim.fn["fzf#install"]()
    end,
  },
  ["nacro90/numb.nvim"] = {
    event = "BufRead",
    config = function()
      require "custom.plugins.numb"
    end,
  },
  ["windwp/nvim-ts-autotag"] = {
    event = "InsertEnter",
    opt = true,
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("custom.plugins.smolconfigs").autotag()
    end,
  },
  ["nvim-treesitter/playground"] = {
    opt = true,
    cmd = { "TSCaptureUnderCursor", "TSPlaygroundToggle" },
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },
  -- ["nvim-neorg/neorg"] = {
  --   ft = "norg",
  --   after = "nvim-treesitter",
  --   config = function()
  --     require "custom.plugins.neorg"
  --   end,
  --   requires = { "nvim-neorg/neorg-telescope", ft = { "norg" } },
  -- },
  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function()
      require "custom.plugins.alpha"
    end,
  },
  ["anuvyklack/fold-preview.nvim"] = {
    -- event = "BufRead",
    requires = "anuvyklack/keymap-amend.nvim",
    config = function()
      require "custom.plugins.pretty-fold"
    end,
  },
  ["neovim/nvim-lspconfig"] = {
    wants = {
      "mason.nvim",
      "mason-lspconfig.nvim",
      "mason-tool-installer.nvim",
    },
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "b0o/schemastore.nvim", module = "schemastore" },
      {
        "mhartington/formatter.nvim",
        config = function()
          require "custom.plugins.formatter"
        end,
      },
      {
        "jose-elias-alvarez/typescript.nvim",
        module = "typescript",
      },
      {
        "folke/lua-dev.nvim",
        ft = "lua",
        opt = true,
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
      require "custom.plugins.lspconfig"
      require "custom.plugins.dap"
    end,
  },
}
