return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is way too old and doesn't work on Windows
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    -- "RRethy/nvim-treesitter-textsubjects",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "HiPhish/rainbow-delimiters.nvim"
  },
  cmd = { "TSUpdateSync" },
  opts = {
    ensure_installed = {
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
      "typescript",
      "tsx",
      "css",
      "rust",
      -- "yaml",
      "markdown",
      "markdown_inline",
      "lua"
    },
    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    -- auto_install = true,
    highlight = { enable = true },
    indent = {
      enable = true,
    },
    -- context_commentstring = {
    --   enable = true,
    --   enable_autocmd = false,
    -- },
    rainbow = { enable = true },
    -- matchup = {
    --   enable = true, -- mandatory, false will disable the whole extension
    -- },
    endwise = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<c-space>",
        node_incremental = "<c-space>",
        scope_incremental = "<c-s>",
        node_decremental = "<M-space>",
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
  },
  config = function(_, opts)
    require('ts_context_commentstring').setup {}
    vim.g.skip_ts_context_commentstring_module = true
    require('rainbow-delimiters.setup').setup {}
    require("nvim-treesitter.configs").setup(opts)
  end,
}
