local M = {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
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
      dependencies = {
        "mattn/webapi-vim",
        "felipec/vim-sanegx",
        "rust-lang/rust.vim",
        "nvim-lua/plenary.nvim",
        {
          "rcarriga/nvim-dap-ui",
          dependencies = { "mfussenegger/nvim-dap", "jayp0521/mason-nvim-dap.nvim" },
        },
      },
    },
  },
}

function M.config()
  local lspconfig = require "lspconfig"
  local tw_highlight = require "tailwind-highlight"

  require("lsp-format").setup {}

  local utils = require "core.utils"
  local schemastore = require "schemastore"

  local C = {}

  C.on_attach = function(client, bufnr)
    utils.load_mappings("lspconfig", { buffer = bufnr })

    tw_highlight.setup(client, bufnr, {
      single_column = false,
      mode = "background",
      debounce = 200,
    })

    if client.server_capabilities.definitionProvider then
      vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
    end

    require("lsp-format").on_attach(client)
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    },
  }

  C.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  local options = {
    on_attach = C.on_attach,
    capabilities = C.capabilities,
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
            command = "clippy",
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
    tsserver = {
      disable_formatting = true,
      debug = false,
      server = {
        settings = {
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
