local present, lualine = pcall(require, "lualine")
local custom_config = require "core.custom"
-- local winbar = require "plugins.winbar"

if not present then
  return
end

local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

local function separator()
  return "%="
end

local function lsp_client(msg)
  msg = msg or ""
  local buf_clients = vim.lsp.buf_get_clients()
  if next(buf_clients) == nil then
    if type(msg) == "boolean" or #msg == 0 then
      return ""
    end
    return msg
  end

  local buf_ft = vim.bo.filetype
  local buf_client_names = {}

  -- add client
  for _, client in pairs(buf_clients) do
    if client.name ~= "null-ls" then
      table.insert(buf_client_names, client.name)
    end
  end

  -- add formatter
  local formatters = require "plugins.lsp.null-ls.formatters"
  local supported_formatters = formatters.list_registered(buf_ft)
  vim.list_extend(buf_client_names, supported_formatters)

  -- add linter
  local linters = require "plugins.lsp.null-ls.linters"
  local supported_linters = linters.list_registered(buf_ft)
  vim.list_extend(buf_client_names, supported_linters)

  -- add hover
  local hovers = require "plugins.lsp.null-ls.hovers"
  local supported_hovers = hovers.list_registered(buf_ft)
  vim.list_extend(buf_client_names, supported_hovers)

  return "[" .. table.concat(buf_client_names, ", ") .. "]"
end

local options = {
  theme = custom_config.current_theme(),
  icons_enabled = true,
  disabled_filetypes = {
    statusline = {},
    winbar = {
      "help",
      "startify",
      "dashboard",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "alpha",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      "branch",
      "diff",
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        colored = false,
      },
    },
    lualine_c = {
      { separator },
      { lsp_client, icon = " ", color = { fg = colors.violet, gui = "bold" } },
      -- { lsp_progress },
      -- {
      --   gps.get_location,
      --   cond = gps.is_available,
      --   color = { fg = colors.green },
      -- },
    },
    lualine_x = { "filename", "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  -- tabline = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = { require 'tabline'.tabline_buffers },
  --   lualine_x = { require 'tabline'.tabline_tabs },
  --   lualine_y = {},
  --   lualine_z = {},
  -- },
  -- winbar = {
  --   lualine_a = { winbar.show_winbar },
  --   lualine_b = {},
  --   lualine_c = {},
  --   lualine_x = {
  --     {
  --       "diagnostics",
  --       sources = { "nvim_diagnostic" },
  --       diagnostics_color = {
  --         error = "DiagnosticError",
  --         warn = "DiagnosticWarn",
  --         info = "DiagnosticInfo",
  --         hint = "DiagnosticHint",
  --       },
  --       colored = true,
  --       on_click = function()
  --         vim.diagnostic.setloclist()
  --       end,
  --     },
  --   },
  --   lualine_y = {},
  --   lualine_z = {},
  -- },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { "quickfix", "toggleterm", "symbols-outline", "nvim-tree", "fugitive" },
}

lualine.setup {
  options = options,
}
