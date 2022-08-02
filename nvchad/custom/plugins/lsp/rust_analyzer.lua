local utils = require "core.utils"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local function show_documentation()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    require("lspsaga.hover").render_hover_doc()
  end
end

local mappings = {
  n = {
    ["<leader>rr"] = { "<cmd>RustRun<cr>", "異  run app" },
    ["<leader>rp"] = { "<cmd>RustRunnables<cr>", "   runnables" },
    ["<leader>rR"] = { "<cmd>RustReloadWorkspace<cr>", "勒  reload workspace" },
    ["<leader>ry"] = { "<cmd>RustPlay<cr>", "奈  copy to play" },
    ["<leader>ro"] = { "<cmd>RustParentModule<cr>", "倫  go to parent" },
    ["<leader>rc"] = { "<cmd>RustOpenCargo<cr>", "   go to cargo" },
  },
}

require("rust-tools").setup {
  tools = {
    hover_actions = {
      border = "double",
    },
    inlay_hints = {
      auto = true,
      only_current_line = false,
    },
  },
  -- dap = {
  --   adapter = require("rust-tools.dap").get_codelldb_adapter(
  --     "/home/simrat39/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/adapter/codelldb",
  --     "/home/simrat39/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/lldb/lib/liblldb.so"
  --   ),
  -- },
  server = {
    capabilities = capabilities,
    on_attach = function(_, bufnr)
      local lsp_mappings = utils.load_config().mappings.lspconfig
      utils.load_mappings({ lsp_mappings, mappings }, { buffer = bufnr })

      vim.keymap.set("n", "K", show_documentation, { noremap = true, silent = true })
    end,
  },
}
