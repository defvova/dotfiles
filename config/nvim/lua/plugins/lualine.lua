local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "BufReadPre",
}

function M.config()
  local lualine = require "lualine"
  local custom_config = require "core.custom"
  local palette = require("core.theme").palette

  local function lsp_client(msg)
    msg = msg or ""
    local buf_clients = vim.lsp.buf_get_clients()
    if next(buf_clients) == nil then
      if type(msg) == "boolean" or #msg == 0 then
        return ""
      end
      return msg
    end

    local buf_client_names = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
        table.insert(buf_client_names, client.name)
      end
    end

    return "[" .. table.concat(buf_client_names, ", ") .. "]"
  end

  local options = {
    options = {
      theme = custom_config.current_theme(),
      icons_enabled = true,
      disabled_filetypes = {
        statusline = {},
      },
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        "diff",
        {
          "diagnostics",
          sources = { "nvim_lsp" },
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
          colored = true,
        },
      },
      lualine_c = {
        { lsp_client, icon = " ", color = { fg = palette.accent, gui = "bold" } },
      },
      lualine_x = {},
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    extensions = { "quickfix", "toggleterm", "symbols-outline", "nvim-tree" },
  }

  lualine.setup(options)
end

return M
