return {
  'mrcjkb/rustaceanvim',
  version = '^4',
  ft = { 'rust' },
  config = function()
    local mason_registry = require("mason-registry")

    local codelldb = mason_registry.get_package("codelldb")
    local extension_path = codelldb:get_install_path() .. "/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

    local cfg = require('rustaceanvim.config')

    vim.g.rustaceanvim = function()
      local rustacean_opts = {
        tools = {
        },
        server = {
          on_attach = function(client, bufnr)
            local lsp_zero = require "lsp-zero"
            lsp_zero.on_attach(client, bufnr)
            lsp.on_dap_attach(bufnr)
          end,
          default_settings = {
            ['rust-analyzer'] = {
              files = {
                excludeDirs = {
                  "node_modules",
                }
              },
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              procMacro = {
                enable = true,
                ignored = {
                  ['async-trait'] = { 'async_trait' },
                  ['napi-derive'] = { 'napi' },
                  ['async-recursion'] = { 'async_recursion' },
                },
              },
            },
          },
        },
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
      return rustacean_opts
    end
  end
}
