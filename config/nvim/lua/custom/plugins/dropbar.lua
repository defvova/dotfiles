return {
  'Bekaboo/dropbar.nvim',
  lazy = false,
  enabled = function()
    return vim.fn.has("nvim-0.10.0") == 1
  end,
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim'
  },
  opts = {}
}
