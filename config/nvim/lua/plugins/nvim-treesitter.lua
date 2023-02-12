return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  build = ":TSUpdate",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    "RRethy/nvim-treesitter-textsubjects",
    "p00f/nvim-ts-rainbow",
  },
  opts = {
    ensure_installed = {
      "norg",
      "cmake",
      "comment",
      "dockerfile",
      "graphql",
      "html",
      "http",
      "regex",
      "ruby",
      "scss",
      "bash",
      "javascript",
      "json",
      "toml",
      "lua",
      "typescript",
      "tsx",
      "css",
      "rust",
      "yaml",
      "markdown",
      "markdown_inline",
      "vim",
    },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    rainbow = { enable = true, extended_mode = true },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25,
      persist_queries = false,
    },
    matchup = {
      enable = true, -- mandatory, false will disable the whole extension
    },
    endwise = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    textsubjects = {
      enable = true,
      prev_selection = ",",
      keymaps = {
        ["."] = "textsubjects-smart",
        [";"] = "textsubjects-container-outer",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
