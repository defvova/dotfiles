return {
  "saecki/crates.nvim",
  event = { "BufReadPre Cargo.toml" },
  keys = {
    { "<leader>cd", "<cmd>lua require('crates').open_documentation() <cr>", desc = "[Cargo]: Open documentation" },
    { "<leader>cr", "<cmd>lua require('crates').open_repository() <cr>",    desc = "[Cargo]: Open repository" },
    { "<leader>ch", "<cmd>lua require('crates').open_homepage() <cr>",      desc = "[Cargo]: Open homepage" },
    { "<leader>cc", "<cmd>lua require('crates').open_crates_io() <cr>",     desc = "[Cargo]: Open crates.io" },
    { "<leader>cu", "<cmd>lua require('crates').update_crate() <cr>",       desc = "[Cargo]: Update crate" },
    { "<leader>ca", "<cmd>lua require('crates').update_all_crates() <cr>",  desc = "[Cargo]: Update all crates" },
    { "<leader>cU", "<cmd>lua require('crates').upgrade_crate() <cr>",      desc = "[Cargo]: Upgrade crate" },
    { "<leader>cA", "<cmd>lua require('crates').upgrade_all_crates() <cr>", desc = "[Cargo]: Upgrade all crates" },
    { "<leader>ct", "<cmd>lua require('crates').toggle() <cr>",             desc = "[Cargo]: Toggle UI elements" },
    { "<leader>cR", "<cmd>lua require('crates').reload() <cr>",             desc = "[Cargo]: Reload data" },
    { "<leader>cu", "<cmd>lua require('crates').update_creates() <cr>",     desc = "[Cargo]: Update crates",     mode = { "n", "v" } },
    { "<leader>cU", "<cmd>lua require('crates').upgrade_crates() <cr>",     desc = "[Cargo]: Upgrade crates",    mode = { "n", "v" } },
  },
  opts = {
    null_ls = {
      enabled = true,
      name = "crates.nvim",
    },
  },
}
