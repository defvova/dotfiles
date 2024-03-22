return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble", "TroubleRefresh" },
  opts = { use_diagnostic_signs = true },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "[Diagnostics]: Document Diagnostics (Trouble)" },
    { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "[Diagnostics]: Workspace Diagnostics (Trouble)" },
  },
}
