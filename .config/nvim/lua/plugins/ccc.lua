return {
  "uga-rosa/ccc.nvim",
  -- event = "VeryLazy",
  cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterToggle" },
  -- ft = { "lua", "css", "html", "sass", "less", "typescriptreact" },
  init = function()
    require("legendary").commands({
      {
        ":CccPick",
        description = "[Colors]: Detects and replaces the color under the cursor"
      },
      {
        ":CccConvert",
        description = "[Colors]: Convert color formats directly without opening the UI"
      },
      {
        ":CccHighlighterEnable",
        description = "[Colors]: Highlight colors in the buffer"
      },
      {
        ":CccHighlighterToggle",
        description = "[Colors]: Toggle highlight"
      }
    })
  end,
  config = function()
    local ccc = require "ccc"
    ccc.setup {
      highlighter = {
        auto_enable = true,
        excludes = { "dart", "lazy", "orgagenda", "org", "NeogitStatus", "toggleterm" },
      },
      pickers = {
        ccc.picker.hex,
        ccc.picker.css_rgb,
        ccc.picker.css_hsl,
        ccc.picker.css_name,
      },
    }
  end,
}
