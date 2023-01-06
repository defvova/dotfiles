local M = {
  "numToStr/Comment.nvim",
  keys = {
    { "gc", "gb", desc = "Comment/Uncomment" },
  },
}

function M.config()
  local nvim_comment = require "Comment"

  local options = {}

  nvim_comment.setup(options)
end

return M
