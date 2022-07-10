return {
  ["b0o/schemastore.nvim"] = {},
  ["ludovicchabant/vim-gutentags"] = {},
  ["weilbith/nvim-code-action-menu"] = {
    cmd = "CodeActionMenu",
  },
  ["kosayoda/nvim-lightbulb"] = {
    requires = "antoinemadec/FixCursorHold.nvim",
    config = function()
      require("custom.plugins.smolconfigs").lightbulb()
    end,
  },
  ["ur4ltz/surround.nvim"] = {
    event = "BufRead",
    config = function()
      require("custom.plugins.smolconfigs").surround()
    end,
  },
  ["RRethy/vim-illuminate"] = {
    event = { "BufEnter", "BufNewFile" },
    config = function()
      require("custom.plugins.smolconfigs").illuminate()
    end,
  },
  ["karb94/neoscroll.nvim"] = {
    event = "WinScrolled",
    config = function()
      require "custom.plugins.neoscroll"
    end,
  },
  ["monaqa/dial.nvim"] = {
    event = "BufRead",
    config = function()
      require "custom.plugins.dial"
    end,
  },
  ["nvim-telescope/telescope-project.nvim"] = {
    event = "BufWinEnter",
    after = { "telescope.nvim" },
    requires = { "nvim-telescope/telescope-file-browser.nvim" },
    config = function()
      require("custom.plugins.smolconfigs").project()
    end,
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
    event = { "BufRead Cargo.toml" },
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("crates").setup()
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
  ["bennypowers/nvim-regexplainer"] = {
    opt = true,
    cmd = { "RegexplainerToggle", "RegexplainerShow" },
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "custom.plugins.regexplainer"
    end,
  },
  ["simrat39/rust-tools.nvim"] = {
    ft = { "rust", "rs" },
    requires = { "RishabhRD/popfix", "hood/popui.nvim" },
    after = { "nvim-lspconfig" },
    config = function()
      require "custom.plugins.rust-tools"
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
    config = function()
      require("nvim-treesitter.configs").setup {
        context_commentstring = {
          enable = true,
        },
      }
    end,
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
    -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    -- cmd = "Rainbow",
    config = function()
      require("custom.plugins.smolconfigs").matchup()
    end,
  },
  ["folke/trouble.nvim"] = {
    cmd = { "Trouble", "TroubleToggle" },
    config = function()
      require("trouble").setup {}
    end,
  },
  ["nvim-telescope/telescope-frecency.nvim"] = {
    -- keys = { "<M>", "<Leader>" },
    -- after = { "telescope.nvim" },
    -- cmd = {'Telescope'},
    requires = { "tami5/sqlite.lua", module = "sqlite", opt = true },
    -- opt = true,
    config = function()
      require "custom.plugins.frecency"
    end,
  },
  ["sindrets/diffview.nvim"] = {
    event = "BufRead",
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
      "DiffviewFocusFiles",
      "DiffviewToggleFiles",
      "DiffviewRefresh",
    },
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require "custom.plugins.diffview"
    end,
  },
  ["catppuccin/nvim"] = {
    opt = true,
    as = "catppuccinOrg",
    config = function()
      require "custom.plugins.cat"
    end,
  },
  ["phaazon/hop.nvim"] = {
    event = "BufRead",
    as = "hop",
    cmd = {
      "HopWord",
      "HopWordMW",
      "HopWordAC",
      "HopWordBC",
      "HopLine",
      "HopChar1",
      "HopChar1MW",
      "HopChar1AC",
      "HopChar1BC",
      "HopChar2",
      "HopChar2MW",
      "HopChar2AC",
      "HopChar2BC",
      "HopPattern",
      "HopPatternAC",
      "HopPatternBC",
      "HopChar1CurrentLineAC",
      "HopChar1CurrentLineBC",
      "HopChar1CurrentLine",
    },
    config = function()
      require("hop").setup()
    end,
  },
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
    ft = { "ruby", "lua" },
    after = "nvim-treesitter",
    config = function()
      require("custom.plugins.smolconfigs").endwise()
    end,
  },
  ["windwp/nvim-spectre"] = {
    event = "BufRead",
    opt = true,
    requires = "nvim-lua/plenary.nvim",
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
  ["nvim-neorg/neorg"] = {
    ft = "norg",
    after = "nvim-treesitter",
    config = function()
      require "custom.plugins.neorg"
    end,
    requires = { "nvim-neorg/neorg-telescope", ft = { "norg" } },
  },
  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function()
      require "custom.plugins.alpha"
    end,
  },
  ["anuvyklack/pretty-fold.nvim"] = {
    event = "BufRead",
    requires = "anuvyklack/nvim-keymap-amend", -- only for preview
    config = function()
      require "custom.plugins.pretty-fold"
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
}
