return {
  "windwp/nvim-spectre",
  keys = {
    { "<leader>sf", "<cmd>lua require('spectre').open()<cr>", desc = "﯒   find & replace (Spectre)" },
    {
      "<leader>sF",
      "<cmd>lua require('spectre').open_file_search()<cr>",
      desc = "﯒   replace in current file (Spectre)",
    },
  },
  cmd = { "Spectre" },
  opts = {
    line_sep_start = "┌--------------------------------------------------------",
    line_sep = "└--------------------------------------------------------",
  },
}
