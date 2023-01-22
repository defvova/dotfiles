local M = {
  "numToStr/Comment.nvim",
  keys = {
    {
      "<leader>/",
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      desc = "   toggle comment",
    },
    {
      "<leader>/",
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      desc = "   toggle comment",
      mode = "v",
    },
  },
}

function M.config()
  local nvim_comment = require "Comment"

  local options = {}

  nvim_comment.setup(options)
end

return M
