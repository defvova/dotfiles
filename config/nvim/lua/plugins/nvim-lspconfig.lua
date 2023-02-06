local M = {
  "neovim/nvim-lspconfig",
  -- event = "VeryLazy",
  event = "BufReadPre",
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    { "smjonas/inc-rename.nvim", config = true },
    {
      "williamboman/mason.nvim",
      cmd = "Mason",
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
      },
    },
    "princejoogie/tailwind-highlight.nvim",
    {
      "jose-elias-alvarez/null-ls.nvim",
      dependencies = { "lukas-reineke/lsp-format.nvim", "jayp0521/mason-null-ls.nvim" },
    },
    { "b0o/schemastore.nvim" },
    {
      "jose-elias-alvarez/typescript.nvim",
    },
    {
      "folke/neodev.nvim",
      ft = "lua",
    },
    {
      "simrat39/rust-tools.nvim",
      ft = "rust",
      dependencies = {
        "mattn/webapi-vim",
        "felipec/vim-sanegx",
        "rust-lang/rust.vim",
        -- {
        --   "rcarriga/nvim-dap-ui",
        --   dependencies = { "mfussenegger/nvim-dap", "jayp0521/mason-nvim-dap.nvim" },
        --   keys = {
        --     { "<leader>Db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "toggle breakpoint" },
        --     { "<leader>Dc", "<cmd>lua require'dap'.continue()<cr>", desc = "continue" },
        --     { "<leader>Do", "<cmd>lua require('dapui').toggle()<cr>", desc = "open ui" },
        --   },
        --   config = function()
        --     require("dapui").setup()
        --   end,
        -- },
      },
    },
  },
}

local function show_documentation()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    require("lspsaga.hover"):render_hover_doc()
  end
end

local map = function(mode, key, expr, opts)
  opts = vim.tbl_extend("keep", { noremap = true, silent = true, buffer = bufnr }, opts)
  return vim.keymap.set(mode, key, expr, opts)
end

function M.config()
  local lspconfig = require "lspconfig"
  local tw_highlight = require "tailwind-highlight"

  require("lsp-format").setup {}

  local utils = require "core.utils"
  local schemastore = require "schemastore"

  local C = {}

  C.on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    tw_highlight.setup(client, bufnr, {
      single_column = false,
      mode = "background",
      debounce = 200,
    })

    if client.server_capabilities.definitionProvider then
      vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
    end

    map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to LSP definition" })
    map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "lsp definition" })
    map("n", "K", show_documentation, { desc = "lsp hover" })
    map("n", "gi", vim.lsp.buf.implementation, { desc = "lsp implementation" })
    map("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", { desc = "   lsp references" })
    map({ "n", "x" }, "<A-cr>", "<cmd>Lspsaga code_action<CR>", { desc = "   code action menu" })
    map("n", "<leader>la", "<cmd>Lspsaga rename<CR>", { desc = "   lsp rename" })
    map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, { desc = "   add workspace folder" })
    map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, { desc = "   remove workspace folder" })
    map("n", "<leader>lwl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = "   list workspace folders" })

    require("lsp-format").on_attach(client)
  end

  C.capabilities = function()
    local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if status_ok then
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      return cmp_nvim_lsp.default_capabilities(capabilities)
    end
  end

  local options = {
    on_attach = C.on_attach,
    capabilities = C.capabilities(),
    root_dir = vim.loop.cwd,
    flags = {
      debounce_text_changes = 150,
    },
  }

  local servers = {
    rust_analyzer = {
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          checkOnSave = {
            command = "cargo clippy",
            extraArgs = { "--no-deps" },
          },
        },
      },
    },
    tailwindcss = {},
    solargraph = {},
    sumneko_lua = {
      settings = {
        Lua = {
          diagnostics = {
            globals = {
              "vim",
              "use",
              "describe",
              "it",
              "assert",
              "before_each",
              "after_each",
            },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    },
    jsonls = {
      settings = {
        json = {
          schemas = schemastore.json.schemas(),
          validate = { enable = true },
        },
      },
    },
    eslint = {
      root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json"),
      settings = {
        format = {
          enable = true,
        },
      },
    },
    dockerls = {},
    yamlls = {},
    bashls = {},
    emmet_ls = {},
    cssls = {},
    html = {},
    tsserver = {
      disable_formatting = true,
      debug = false,
      server = {
        init_options = {
          preferences = {
            includeCompletionsWithSnippetText = true,
            includeCompletionsForImportStatements = true,
          },
        },
        settings = {
          completions = {
            completeFunctionCalls = true,
          },
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
        },
      },
    },
  }

  lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, options)

  require("plugins.lsp.handlers").setup()
  require("plugins.lsp.null-ls").setup(options)
  require("plugins.lsp.installer").setup(servers, options)
end

return M
