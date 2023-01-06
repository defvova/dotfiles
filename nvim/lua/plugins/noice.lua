local M = {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}

function M.config()
  local noice = require "noice"

  local options = {
    notify = {
      enabled = false,
    },
    messages = {
      enabled = false,
    },
  }

  noice.setup(options)
end

return M
