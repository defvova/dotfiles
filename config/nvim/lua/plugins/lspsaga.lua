local M = {
  "glepnir/lspsaga.nvim",
  event = "VeryLazy",
}

function M.config()
  local lspsaga = require "lspsaga"

  local options = {
    code_action_lightbulb = {
      enable = false,
      enable_in_insert = true,
      cache_code_action = true,
      sign = true,
      update_time = 150,
      sign_priority = 20,
      virtual_text = false,
    },
    symbol_in_winbar = {
      in_custom = false,
      enable = true,
      separator = "  ",
      show_file = true,
      -- define how to customize filename, eg: %:., %
      -- if not set, use default value `%:t`
      -- more information see `vim.fn.expand` or `expand`
      -- ## only valid after set `show_file = true`
      -- file_formatter = "",
      click_support = false,
    },
  }

  lspsaga.init_lsp_saga(options)
end

return M
