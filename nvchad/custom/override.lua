local M = {}

M.ui = {
  statusline = {
    separator_style = "arrow", -- default/round/block/arrow
  },
}

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
    "markdown",
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
  refactor = {
    navigation = {
      enable = false,
      keymaps = {
        goto_definition = "gnd", -- FIXME: update keymaps
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
    smart_rename = {
      enable = false,
      keymaps = {
        smart_rename = "grr",
      },
    },
    highlight_current_scope = { enable = false },
    highlight_definitions = {
      enable = false,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
  },
}

M.packer = {
  max_jobs = 50,
}

M.nvimtree = {
  filters = {
    dotfiles = false,
    custom = { "node_modules", ".cache" },
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
  },
  extensions_list = {
    "file_browser",
    "project",
    "themes",
    "terms",
  },
}

M.gitsigns = {
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 100,
    ignore_whitespace = false,
  },
}

M.mason = {
  ensure_installed = {
    "solargraph",
    "rust-analyzer",
    "lua-language-server",
    "stylua",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "emmet-ls",
    "json-lsp",
    "eslint-lsp",
    "dockerfile-language-server",
    "bash-language-server",
    "yaml-language-server",
  },
}

return M
