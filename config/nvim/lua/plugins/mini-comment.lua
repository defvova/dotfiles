return {
  "echasnovski/mini.comment",
  keys = {
    { "<leader>/", "gcc", desc = "   toggle comment", remap = true },
    { "<leader>/", "gc", desc = "   toggle comment", mode = { "x", "v" }, remap = true },
  },
  opts = {
    hooks = {
      pre = function()
        require("ts_context_commentstring.internal").update_commentstring {}
      end,
    },
  },
  config = function(_, opts)
    require("mini.comment").setup(opts)
  end,
}

-- local M = {
--   "numToStr/Comment.nvim",
--   keys = {
--     {
--       "<leader>/",
--       function()
--         require("Comment.api").toggle.linewise.current()
--       end,
--       desc = "   toggle comment",
--     },
--     {
--       "<leader>/",
--       "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
--       desc = "   toggle comment",
--       mode = "v",
--     },
--   },
-- }
--
-- function M.config()
--   local nvim_comment = require "Comment"
--
--   local options = {}
--
--   nvim_comment.setup(options)
-- end
--
-- return M
