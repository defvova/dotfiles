return {
  "echasnovski/mini.pairs",
  event = "InsertEnter",
  config = function(_, opts)
    require("mini.pairs").setup(opts)
  end,
}

-- local M = {
--   "windwp/nvim-autopairs",
--   lazy = false,
--   -- event = "InsertEnter",
--   -- dependencies = {
--   --   "nvim-cmp",
--   -- },
-- }
--
-- function M.config()
--   local autopairs = require "nvim-autopairs"
--   -- local cmp = require "cmp"
--
--   local options = {
--     fast_wrap = {},
--     disable_filetype = { "TelescopePrompt", "vim" },
--   }
--
--   autopairs.setup(options)
--
--   -- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
--   -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
-- end
--
-- return M
