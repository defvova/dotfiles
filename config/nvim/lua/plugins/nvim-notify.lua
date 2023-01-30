return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<ESC>",
      function()
        vim.cmd "noh"
        require("notify").dismiss { silent = true, pending = true }
      end,
      desc = "Delete all Notifications",
    },

    ["<ESC>"] = { "<cmd> noh <CR>", "no highlight" },
  },
  opts = {
    render = "compact",
    stages = "fade",
    timeout = 3000,
    fps = 30,
    ---@usage notifications with level lower than this would be ignored. [ERROR > WARN > INFO > DEBUG > TRACE]
    level = "WARN",
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
  },
}
