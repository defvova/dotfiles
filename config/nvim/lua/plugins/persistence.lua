return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
    options = { "buffers", "curdir", "tabpages", "winsize", "help" },
  },
  keys = {
    {
      "<leader>Sc",
      function()
        require("persistence").load()
      end,
      desc = "ﭯ   restore last session for current dir",
    },
    {
      "<leader>Sl",
      function()
        require("persistence").load { last = true }
      end,
      desc = "ﮦ   restore last session",
    },
    {
      "<leader>SQ",
      function()
        require("persistence").stop()
      end,
      desc = "   quit without saving session",
    },
  },
}
