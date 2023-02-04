return {
  "glepnir/galaxyline.nvim",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  config = function()
    require "plugins.ui.galaxyline"
  end,
}
