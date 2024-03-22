local M = {
  "monaqa/dial.nvim",
  keys = {
    {
      "<C-z>", desc = "[Toggle]: Increment", mode = { 'n', 'v', 'x' }
    },
    {
      "<C-x>", desc = "[Toggle]: Decrement", mode = { 'n', 'v', 'x' }
    }
  }
}

function M.config()
  local augend = require "dial.augend"
  local config = require "dial.config"
  config.augends:register_group {
    default = {
      augend.integer.alias.decimal,
      augend.constant.alias.bool,
      augend.semver.alias.semver,
      augend.date.alias["%Y/%m/%d"],
      augend.date.alias["%Y-%m-%d"],
      augend.date.alias["%m/%d"],
      augend.date.alias["%H:%M"],
      augend.constant.new {
        elements = { "and", "or" },
        word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
        cyclic = true, -- "or" is incremented into "and".
      },
      augend.constant.new {
        elements = { "&&", "||" },
        word = false,
        cyclic = true,
      },
      augend.constant.new {
        elements = { "===", "!==" },
        word = false,
        cyclic = true,
      },
      augend.constant.new {
        elements = { "==", "!=" },
        word = false,
        cyclic = true,
      },
      augend.case.new {
        types = { "camelCase", "snake_case", "PascalCase", "SCREAMING_SNAKE_CASE" },
        cyclic = true,
      },
    },
  }

  vim.api.nvim_set_keymap("n", "<C-z>", require("dial.map").inc_normal(), { noremap = true })
  vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
  vim.api.nvim_set_keymap("v", "<C-z>", require("dial.map").inc_visual(), { noremap = true })
  vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
  vim.api.nvim_set_keymap("v", "g<C-z>", require("dial.map").inc_gvisual(), { noremap = true })
  vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
end

return M
