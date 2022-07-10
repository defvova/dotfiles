local present, rust_tools = pcall(require, "rust-tools")

if not present then
  return
end

local options = {
  tools = {
    autoSetHints = true,
    hover_with_actions = true,
    runnables = {
      use_telescope = true,
    },
    hover_actions = {
      auto_focus = true,
    },
  },
  -- server = {
  --   cmd = { nvim_path .. "lsp_servers/rust/rust-analyzer" },
  --   on_attach = require("lvim.lsp").common_on_attach,
  --   on_init = require("lvim.lsp").common_on_init,
  -- },
}

rust_tools.setup(options)
