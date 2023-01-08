return {
  "abecodes/tabout.nvim",
  config = function()
    require("tabout").setup {
      completion = false,
      ignore_beginning = false,
    }
  end,
}
