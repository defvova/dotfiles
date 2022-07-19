local M = {}

M.setup_lsp = function(attach, capabilities)
  local lsp = vim.lsp
  local lspconfig = require "lspconfig"
  local _, schemastore = pcall(require, "schemastore")

  local border_opts = { border = "single", focusable = false, scope = "line" }
  vim.diagnostic.config { virtual_text = false, float = border_opts }

  capabilities.textDocument.codeAction = {
    dynamicRegistration = true,
    codeActionLiteralSupport = {
      codeActionKind = {
        valueSet = (function()
          local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
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

  do
    local methodDocument = "textDocument/publishDiagnostics"
    local default_handler = lsp.handlers[methodDocument]
    lsp.handlers[methodDocument] = function(err, method, result, client_id, bufnr, config)
      default_handler(err, method, result, client_id, bufnr, config)
      local diagnostics = lsp.diagnostic.get_all()
      local qflist = {}
      for buf, diagnostic in pairs(diagnostics) do
        for _, d in ipairs(diagnostic) do
          d.bufnr = buf
          d.lnum = d.range.start.line + 1
          d.col = d.range.start.character + 1
          d.text = d.message
          table.insert(qflist, d)
        end
      end
      lsp.util.set_qflist(qflist)
      -- vim.diagnostic.setqflist(qflist)
    end
  end
end

return M
