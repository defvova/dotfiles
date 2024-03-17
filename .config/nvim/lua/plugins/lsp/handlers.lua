local M = {}

function M.setup()
  -- local diagnostics = { Error = " ", Warning = " ", Information = " ", Hint = " " }
  -- local signs = {
  --   Error = " ",
  --   Warn = " ",
  --   Info = " ",
  --   Hint = " ",
  -- }
  -- for type, icon in pairs(signs) do
  --   local hl = "DiagnosticSign" .. type
  --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  -- end

  -- LSP handlers configuration
  local config = {
    float = {
      -- focusable = true,
      -- style = "minimal",
      -- border = "rounded",
    },
    document_highlight = false,
    code_lens_refresh = true,
    diagnostic = {
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
        format = function(d)
          local code = d.code or (d.user_data and d.user_data.lsp.code)
          if code then
            return string.format("%s [%s]", d.message, code):gsub("1. ", "")
          end
          return d.message
        end,
      },
    },
  }
  -- local border_opts = { border = "single", focusable = false, scope = "line" }

  -- Diagnostic configuration
  -- vim.diagnostic.config(config.diagnostic)

  -- Disable inline diagnostics error
  -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  --   virtual_text = false,
  --   -- virtual_text = {
  --   --   prefix = "🔥",
  --   --   prefix = "",
  --   --   source = true,
  --   -- },
  -- })

  vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
    require("ts-error-translator").translate_diagnostics(err, result, ctx, config)
    vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, { virtual_text = false })
    -- vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    --   virtual_text = false,
    --   -- virtual_text = {
    --   --   prefix = "🔥",
    --   --   prefix = "",
    --   --   source = true,
    --   -- },
    -- })
  end

  -- -- Hover configuration
  -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float)
  --
  -- -- Signature help configuration
  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float)
end

return M
