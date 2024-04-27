return {
  "mrjones2014/smart-splits.nvim",
  config = true,
  lazy = false,
  keys = {
    {
      "<C-h>",
      function()
        require("smart-splits").move_cursor_left()
      end,
      mode = { 'n', 'i' }
    },
    {
      "<C-j>",
      function()
        require("smart-splits").move_cursor_down()
      end,
      mode = { 'n', 'i' }
    },
    {
      "<C-k>",
      function()
        require("smart-splits").move_cursor_up()
      end,
      mode = { 'n', 'i' }
    },
    {
      "<C-l>",
      function()
        require("smart-splits").move_cursor_right()
      end,
      mode = { 'n', 'i' }
    },
  },
}
