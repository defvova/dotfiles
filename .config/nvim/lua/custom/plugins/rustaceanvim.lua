return {
  'mrcjkb/rustaceanvim',
  version = '^4',
  ft = { 'rust' },
  config = function()
    vim.g.rustaceanvim = function()
      ---@type RustaceanOpts
      local rustacean_opts = {
        tools = {
          executor = 'toggleterm',
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
      }
      return rustacean_opts
    end
  end
}
