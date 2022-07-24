local attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local schemastore = require "schemastore"

local border_opts = { border = "single", focusable = false, scope = "line" }
vim.diagnostic.config { virtual_text = false, float = border_opts }

local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if has_cmp_nvim_lsp then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

local function on_attach(client, bufnr)
  attach(client, bufnr)
end

local servers = {
  solargraph = {},
  rust_analyzer = require("custom.plugins.lsp.rust_analyzer").setup({
    tools = {
      hover_actions = {
        border = "double",
      },
      inlay_hints = {
        auto = true,
        only_current_line = false,
      },
    },
    server = {
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            loadOutDirsFromCheck = true,
          },
          procMacro = {
            enable = true,
          },
        },
      },
    },
  }, capabilities),
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
  tsserver = {},
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
  opts = vim.tbl_deep_extend("force", {}, options, opts or {})
  require("custom.plugins.lsp." .. server).setup(opts)
end
