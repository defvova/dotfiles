local M = {}

M.treesitter = {
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
  },
}

M.nvimtree = {
  filters = {
    dotfiles = false,
    custom = { "node_modules", ".cache", "tags.lock", ".tags", "tags.temp", "tags" },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  auto_reload_on_write = true,
  git = {
    enable = true,
  },
  view = {
    width = 45,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
        { key = "C", action = "cd" },
      },
    },
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.blankline = {
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvchad_cheatsheet",
    "lsp-installer",
    "norg",
    "",
  },
}

M.whichkey = {
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
}

M.telescope = {
  defaults = {
    prompt_prefix = "   ",
    file_ignore_patterns = {
      "%.tags",
      "%tags",
      "tags",
    },
  },
}

return M
