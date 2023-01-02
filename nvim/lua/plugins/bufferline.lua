local present, bufferline = pcall(require, "bufferline")

if not present then
  return
end

local options = {
  color_icons = true,
  separator_style = "thin",
  offsets = {
    {
      filetype = "NvimTree",
      text = function()
        local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        return "EXPLORER: " .. dir_name
      end,
      highlight = "Directory",
      text_align = "left",
    },
  },
  groups = {
    options = {
      toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
    },
    items = {
      {
        name = "Tests",
        -- highlight = { gui = "underline", guisp = "green" },
        auto_close = true,
        -- priority = 2,
        icon = "",
        matcher = function(buf)
          return buf.name:match "%.test" or buf.name:match "%_spec"
        end,
      },
      {
        name = "Docs",
        highlight = { gui = "undercurl", guisp = "green" },
        auto_close = true,
        matcher = function(buf)
          return buf.name:match "%.md" or buf.name:match "%.txt"
        end,
        separator = { -- Optional
          style = require("bufferline.groups").separator.tab,
        },
      },
    },
  },
}

vim.opt.termguicolors = true
bufferline.setup {
  options = options,
}
