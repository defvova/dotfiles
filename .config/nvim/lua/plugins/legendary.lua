return {
  "mrjones2014/legendary.nvim",
  priority = 100000,
  lazy = false,
  dependencies = {
    "kkharji/sqlite.lua",
    "stevearc/dressing.nvim"
  },
  keys = {
    {
      '<leader><Space>',
      mode = { 'n', 'v', 'x' },
      function()
        require('legendary').find({ filters = { require('legendary.filters').current_mode() } })
      end,
      desc = 'Open legendary'
    }
  },
  config = function()
    require("legendary").setup({
      extensions = {
        lazy_nvim = true,
        which_key = false,
        nvim_tree = false,
        smart_splits = true,
        op_nvim = false,
        diffview = false
      },
    })
  end,
}
