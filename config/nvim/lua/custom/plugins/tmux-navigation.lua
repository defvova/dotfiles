return {
  "alexghergh/nvim-tmux-navigation",
  lazy = false,
  opts = {
    disable_when_zoomed = true, -- defaults to false
    keybindings = {
      left = "<C-h>",
      down = "<C-j>",
      up = "<C-k>",
      right = "<C-l>",
    },
  },
}
