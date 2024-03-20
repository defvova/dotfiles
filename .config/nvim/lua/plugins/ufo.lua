return {
  {
    "kevinhwang91/nvim-ufo",
    event = "BufEnter",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    init = function()
      require("legendary").keymaps({
        {
          "zR",
          function()
            require("ufo").openAllFolds()
          end,
          description = "Fold: Open all folds",
        },
        {
          "zM",
          function()
            require("ufo").closeAllFolds()
          end,
          description = "Fold: Close all folds",
        },
        {
          "<BS>",
          'zc',
          description = "Fold: Close block",
        },
      })
    end,
    config = function()
      require("ufo").setup({
        open_fold_hl_timeout = 150,
        close_fold_kinds_for_ft = { default = { 'imports', 'comment' } }
        -- provider_selector = function(_bufnr, _filetype, _buftype)
        --   return { "treesitter", "indent" }
        -- end,
      })
    end,
  },
}
