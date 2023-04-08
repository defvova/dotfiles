return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "TermExec", "ToggleTermSendVisualLines" },
  keys = {
    { "<A-v>", "<cmd>ToggleTerm size=90 direction=vertical<cr>", mode = { "n", "t" } },
    { "<A-h>", "<cmd>ToggleTerm size=40 direction=horizontal<cr>", mode = { "n", "t" } },
    -- { "<C-`>", "<cmd>ToggleTermToggleAll<cr>", mode = { "n", "t" } },
  },
  opts = {
    open_mapping = [[<C-`>]],
    shade_terminals = false,
    shading_factor = 0.3,
  },
}
