return {
  "kevinhwang91/nvim-bqf",
  ft = "qf",
  dependencies = { "junegunn/fzf" },
  build = function()
    vim.fn["fzf#install"]()
  end,
  opts = {
    auto_enable = true,
    -- auto_resize_height = true,
    preview = {
      win_height = 20,
      win_vheight = 20,
      winblend = 0,
      delay_syntax = 80,
      border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
    },
    func_map = {
      vsplit = "",
      ptogglemode = "z,",
      stoggleup = "",
    },
    filter = {
      fzf = {
        action_for = { ["ctrl-s"] = "split" },
        extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
      },
    },
  },
  config = function(_, opts)
    local bqf = require "bqf"
    bqf.setup(opts)
  end,
}
