local M = {}

M.setup_lsp = function(attach, capabilities)
  local lsp = vim.lsp
  local lspconfig = require "lspconfig"
  local _, schemastore = pcall(require, "schemastore")

  local border_opts = { border = "single", focusable = false, scope = "line" }
  vim.diagnostic.config { virtual_text = false, float = border_opts }

  -- Improve compatibility with nvim-cmp completions
  local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if has_cmp_nvim_lsp then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  end

  capabilities.textDocument.codeAction = {
    dynamicRegistration = true,
    codeActionLiteralSupport = {
      codeActionKind = {
        valueSet = (function()
          local res = vim.tbl_values(lsp.protocol.CodeActionKind)
          table.sort(res)
          return res
        end)(),
      },
    },
  }

  local function on_attach(client, bufnr)
    -- require("nvim-navic").attach(client, bufnr)
    attach(client, bufnr)
  end

  local servers = {
    rust_analyzer = {
      settings = {
        ["rust-analyzer"] = {
          completion = {
            autoimport = { enable = true },
          },
          inlayHints = {
            enable = true,
          },
          cargo = { allFeatures = true },
          -- enable clippy on save
          checkOnSave = {
            command = "clippy",
            extraArgs = { "--no-deps" },
          },
        },
      },
    },
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
end

return M
