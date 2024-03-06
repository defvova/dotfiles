return {
  "uga-rosa/ccc.nvim",
  -- event = "VeryLazy",
  cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterToggle" },
  -- ft = { "lua", "css", "html", "sass", "less", "typescriptreact" },
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
