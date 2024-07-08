return {
  {
    "kevinhwang91/nvim-ufo",
    event = "BufEnter",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
        desc = "[Fold]: Open all folds",
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
        desc = "[Fold]: Close all folds",
      },
      {
        "<BS>",
        "zc",
        desc = "[Fold]: Close block",
      },
    },
    config = function()
      require("ufo").setup {
        open_fold_hl_timeout = 150,
        -- close_fold_kinds_for_ft = { default = { 'imports', 'comment' } }
        -- provider_selector = function(_bufnr, _filetype, _buftype)
        --   return { "treesitter", "indent" }
        -- end,
      }
    end,
  },
}
