-- https://github.com/mrjones2014/dotfiles/blob/master/nvim/lua/my/legendary/commands.lua
-- https://github.com/olimorris/dotfiles/blob/main/.config/nvim/lua/plugins/utilities.lua
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
      include_builtin = false,
      include_legendary_cmds = false,
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
