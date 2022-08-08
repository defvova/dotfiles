local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local utils = require "core.utils"
local schemastore = require "schemastore"
local M = {}

local setup_auto_format = require("custom.utils").setup_auto_format
local filetypes = {
  "lua",
  "rb",
  "js",
  "ts",
  "rs",
  "json",
}

for _, ft in pairs(filetypes) do
  setup_auto_format(ft, "FormatWrite")
end

M.on_attach = function(client, bufnr)
  if vim.g.vim_version > 7 then
    -- nightly
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  else
    -- stable
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
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

M.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

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

require("custom.plugins.lsp.handlers").setup()
require("custom.plugins.lsp.installer").setup(servers, options)

local border_opts = { border = "single", focusable = false, scope = "line" }
vim.diagnostic.config { virtual_text = false, float = border_opts }

local function show_documentation()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    require("lspsaga.hover").render_hover_doc()
  end
end

vim.keymap.set("n", "K", show_documentation, { noremap = true, silent = true })
