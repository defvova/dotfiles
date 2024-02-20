return {
  {
    "kevinhwang91/nvim-ufo",
    event = "BufEnter",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    -- keys = {
    --   "zR", "zM"
    -- },
    config = function()
      --- @diagnostic disable: unused-local
      require("ufo").setup({
        open_fold_hl_timeout = 150,
        close_fold_kinds = { 'imports', 'comment' },
        provider_selector = function(_bufnr, _filetype, _buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
}
