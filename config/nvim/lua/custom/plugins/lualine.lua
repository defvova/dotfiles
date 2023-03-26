return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  opts = function(plugin)
    local assets = {
      mode_icon = "",
      dir = "",
      file = "",
      lsp = {
        server = "",
        error = "",
        warning = "",
        info = "",
        hint = "",
      },
      git = {
        branch = "",
        added = "",
        changed = "",
        removed = "",
      },
    }

    local lualine = require "lualine"
    local palette = require("core.theme").palette

    local function lsp_client(msg)
      msg = msg or "No Active Lsp"
      local buf_clients = vim.lsp.buf_get_clients()
      if next(buf_clients) == nil then
        if type(msg) == "boolean" or #msg == 0 then
          return ""
        end
        return msg
      end

      local buf_client_names = {}

      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      return table.concat(buf_client_names, ", ")
    end
    return {
      options = {
        component_separators = "|",
        section_separators = "",
        theme = "auto",
        icons_enabled = true,
        disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
      },
      sections = {
        lualine_a = {},
        lualine_b = {
          "progress",
          "location",
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
          {
            lsp_client,
            icon = " LSP:",
            color = { fg = palette.accent, gui = "bold" },
            on_click = function()
              vim.cmd [[LspInfo]]
            end,
          },
        },
        lualine_x = {
          { require("lazy.status").updates, cond = require("lazy.status").has_updates },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 0, symbols = { modified = "  ", readonly = "", unnamed = "" } },
          {
            function()
              local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
              return dir_name
            end,
            icon = assets.dir,
            color = {
              fg = palette.accent,
            },
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "quickfix", "toggleterm", "symbols-outline", "neo-tree" },
    }
  end,
}
