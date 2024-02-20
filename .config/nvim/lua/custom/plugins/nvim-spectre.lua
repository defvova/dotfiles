return {
  "windwp/nvim-spectre",
  enabled = false,
  keys = {
    { "<leader>sf", "<cmd>lua require('spectre').open()<cr>", desc = "[S]earch in [F]iles (Spectre)" },
    {
      "<leader>sF",
      "<cmd>lua require('spectre').open_file_search()<cr>",
      desc = "[S]earch & replace in current [F]ile (Spectre)",
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
