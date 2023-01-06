local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufRead",
  build = ":TSUpdate",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "BufReadPost",
    },
    { "RRethy/nvim-treesitter-textsubjects", event = "VeryLazy" },
    { "p00f/nvim-ts-rainbow", event = { "CursorHold", "CursorHoldI" } },
  },
}

function M.config()
  local treesitter = require "nvim-treesitter.configs"

  local options = {
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
    textsubjects = {
      enable = true,
      prev_selection = ",",
      keymaps = {
        ["."] = "textsubjects-smart",
        [";"] = "textsubjects-container-outer",
      },
    },
  }

  treesitter.setup(options)
end

return M
