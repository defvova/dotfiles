require "core.options"
require "core.lazy"

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require "core"
    require "core.keymaps"
    require("core.utils").load_mappings()
  end,
})
