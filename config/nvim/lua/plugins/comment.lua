return {
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
  config = function()
    require("Comment").setup {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      mappings = {
        basic = false,
        extra = false,
      },
    }
  end,
}
