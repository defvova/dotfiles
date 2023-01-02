local present, rust_tools = pcall(require, "rust-tools")

if not present then
  return
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if has_cmp_nvim_lsp then
--   capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
-- end

local options = {
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
    -- capabilities = capabilities,
  },
}

rust_tools.setup(options)
