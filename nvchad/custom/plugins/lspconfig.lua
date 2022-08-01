local attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local schemastore = require "schemastore"

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

local border_opts = { border = "single", focusable = false, scope = "line" }
vim.diagnostic.config { virtual_text = false, float = border_opts }

local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if has_cmp_nvim_lsp then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

local function on_attach(client, bufnr)
  attach(client, bufnr)

  local map = vim.api.nvim_buf_set_keymap
  map(0, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
  map(0, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
end

local servers = {
  solargraph = {},
  sumneko_lua = require("lua-dev").setup {
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
}

local other_servers = {
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

local options = {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = vim.loop.cwd,
  flags = {
    debounce_text_changes = 150,
  },
}

for server, opts in pairs(servers) do
  opts = vim.tbl_deep_extend("force", {}, options, opts or {})
  lspconfig[server].setup(opts)
end

for server, opts in pairs(other_servers) do
  require("custom.plugins.lsp." .. server).setup(opts, options)
end
