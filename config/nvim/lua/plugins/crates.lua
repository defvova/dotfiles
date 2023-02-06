return {
  "saecki/crates.nvim",
  event = { "BufReadPre Cargo.toml" },
  keys = {
    { "<leader>cd", "<cmd>lua require('crates').open_documentation() <cr>", desc = "open documentation" },
    { "<leader>cr", "<cmd>lua require('crates').open_repository() <cr>", desc = "open repository" },
    { "<leader>ch", "<cmd>lua require('crates').open_homepage() <cr>", desc = "open homepage" },
    { "<leader>cc", "<cmd>lua require('crates').open_crates_io() <cr>", desc = "open crates.io" },
    { "<leader>cu", "<cmd>lua require('crates').update_crate() <cr>", "update crate" },
    { "<leader>ca", "<cmd>lua require('crates').update_all_crates() <cr>", "update all crates" },
    { "<leader>cU", "<cmd>lua require('crates').upgrade_crate() <cr>", "upgrade crate" },
    { "<leader>cA", "<cmd>lua require('crates').upgrade_all_crates() <cr>", "upgrade all crates" },
    { "<leader>ct", "<cmd>lua require('crates').toggle() <cr>", "toggle UI elements" },
    { "<leader>cR", "<cmd>lua require('crates').reload() <cr>", "reload data" },
    { "<leader>cu", "<cmd>lua require('crates').update_creates() <cr>", "update crates", mode = { "n", "v" } },
    { "<leader>cU", "<cmd>lua require('crates').upgrade_crates() <cr>", "upgrade crates", mode = { "n", "v" } },
  },
  opts = {
    null_ls = {
      enabled = true,
      name = "crates.nvim",
    },
  },
}
