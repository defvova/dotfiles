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
  config = function(_, opts)
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      -- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end
    vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

    require("toggleterm").setup(opts)
  end,
}
