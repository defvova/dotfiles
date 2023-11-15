return {
  "linrongbin16/lsp-progress.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("lsp-progress").setup()
  end,
}
