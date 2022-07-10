local M = {}

M.setup_lsp = function(attach, capabilities)
  local present, schemastore = pcall(require, "schemastore")
  local lspconfig = require "lspconfig"

  local servers = {
    "html",
    "cssls",
    "cssmodules_ls",
    "bashls",
    "eslint",
    "emmet_ls",
    "dockerls",
    "graphql",
    "jsonls",
    "rust_analyzer",
    "solargraph",
    "sqlls",
    "sumneko_lua",
    "tailwindcss",
    "tsserver",
    "yamlls",
    "stylelint_lsp",
  }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = attach,
      capabilities = capabilities,
      root_dir = vim.loop.cwd,
    }
  end

  if present then
    lspconfig.jsonls.setup {
      settings = {
        json = {
          schemas = schemastore.json.schemas(),
          validate = { enable = true },
        },
      },
    }
  end
end

return M
