local present, lspconfig = pcall(require, "lspconfig")
local tw_present, tw_highlight = pcall(require, "tailwind-highlight")

if not present then
  return
end

local navic = require "nvim-navic"
local utils = require "core.utils"
local schemastore = require "schemastore"

local M = {}

local filetypes = {
  "lua",
  "rb",
  "js",
  "ts",
  "rs",
  "json",
}

for _, ft in pairs(filetypes) do
  utils.setup_auto_format(ft, "FormatWrite")
end

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if tw_present then
    tw_highlight.setup(client, bufnr, {
      single_column = false,
      mode = "background",
      debounce = 200,
    })
  end

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  if client.server_capabilities.definitionProvider then
    vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
  end
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

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local options = {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
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
require("plugins.lsp.installer").setup(servers, options)
