return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
  event = "BufReadPost",
  opts = {
    char = "▏",
    -- char = "│",
    filetype_exclude = { "help", "terminal", "alpha", "dashboard", "lspinfo", "neo-tree", "Trouble", "lazy" },
    show_trailing_blankline_indent = false,
    show_current_context = true,
  },
}
-- local M = {
--   "lukas-reineke/indent-blankline.nvim",
--   enabled = false,
-- }
--
-- function M.config()
--   local blankline = require "indent_blankline"
--
--   local options = {
--     indentLine_enabled = 1,
--     filetype_exclude = {
--       "help",
--       "terminal",
--       "alpha",
--       "packer",
--       "lspinfo",
--       "TelescopePrompt",
--       "TelescopeResults",
--       "nvchad_cheatsheet",
--       "lsp-installer",
--       "norg",
--       "",
--     },
--     buftype_exclude = { "terminal" },
--     show_trailing_blankline_indent = false,
--     show_first_indent_level = false,
--     show_current_context = true,
--     show_current_context_start = true,
--   }
--
--   blankline.setup(options)
-- end
--
-- return M
