return {
  "kawre/leetcode.nvim",
  cmd = "Leet",
  init = function()
    require("legendary").commands({
      {
        ":Leet",
        description = "[Teach]: Open leet code"
      }
    })
  end,
  opts = {
    lang = 'ruby',
    plugins = {
      non_standalone = true,
      fidget = false,
    },
  }
}
