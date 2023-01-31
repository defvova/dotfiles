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
    open_cmd = "new",
    is_insert_mode = true,
    line_sep_start = "┌--------------------------------------------------------",
    line_sep = "└--------------------------------------------------------",
    mapping = {
      ["send_to_qf"] = {
        map = "<leader>q",
        cmd = "<cmd>close<CR>",
        desc = "close spectre",
      },
    },
  },
}
