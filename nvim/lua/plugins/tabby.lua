local present, tabby = pcall(require, "tabby")

if not present then
  return
end

local filename = require "tabby.filename"
local util = require "tabby.util"

local cwd = function()
  return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
end

local line = {
  hl = "TabLineFill",
  layout = "active_wins_at_tail",
  head = {
    { cwd, hl = "EdenTLHead" },
    { "", hl = "EdenTLHeadSep" },
  },
  active_tab = {
    label = function(tabid)
      return {
        "  " .. tabid .. " ",
        hl = "EdenTLActive",
      }
    end,
    left_sep = { "", hl = "EdenTLActiveSep" },
    right_sep = { "", hl = "EdenTLActiveSep" },
  },
  inactive_tab = {
    label = function(tabid)
      return {
        "  " .. tabid .. " ",
        hl = "EdenTLBoldLine",
      }
    end,
    left_sep = { "", hl = "EdenTLLineSep" },
    right_sep = { "", hl = "EdenTLLineSep" },
  },
  top_win = {
    label = function(winid)
      return {
        "  " .. filename.unique(winid) .. " ",
        hl = "TabLine",
      }
    end,
    left_sep = { "", hl = "EdenTLLineSep" },
    right_sep = { "", hl = "EdenTLLineSep" },
  },
  win = {
    label = function(winid)
      return {
        "  " .. filename.unique(winid) .. " ",
        hl = "TabLine",
      }
    end,
    left_sep = { "", hl = "EdenTLLineSep" },
    right_sep = { "", hl = "EdenTLLineSep" },
  },
  tail = {
    { "", hl = "EdenTLHeadSep" },
    { "  ", hl = "EdenTLHead" },
  },
}

local options = {
  tabline = line,
}

tabby.setup(options)
