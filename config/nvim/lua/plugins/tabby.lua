local M = {
  "nanozuki/tabby.nvim",
  event = "BufReadPre",
}

function M.config()
  local palette = require("core.theme").palette
  local theme = {
    fill = { fg = palette.fg_sec, bg = palette.bg },
    head = { fg = palette.fg_sec, bg = palette.bg, style = "italic" },
    current_tab = { fg = palette.fg, bg = palette.accent, style = "bold" },
    tab = { fg = palette.fg3, bg = palette.accent_sec, style = "bold" },
    win = { fg = palette.fg, bg = palette.bg_sec },
    tail = { fg = palette.bg, bg = palette.accent_sec, style = "bold" },
  }

  vim.opt.showtabline = 2
  require("tabby.tabline").set(function(line)
    local cwd = " ﱮ " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
    return {
      {
        { cwd, hl = theme.head },
        line.sep("", theme.head, theme.fill),
      },
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab
        return {
          line.sep("", hl, theme.fill),
          tab.is_current() and "  " or "  ",
          tab.number(),
          tab.name(),
          -- tab.close_btn(' '), -- show a close button
          line.sep("", hl, theme.fill),
          margin = " ",
          hl = hl,
        }
      end),
      line.spacer(),
      -- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      --   return {
      --     line.sep('', theme.win, theme.fill),
      --     win.is_current() and '' or '',
      --     win.buf_name(),
      --     line.sep('', theme.win, theme.fill),
      --     margin = ' ',
      --     hl = theme.win,
      --   }
      -- end),
      {
        line.sep("", theme.tail, theme.fill),
        { "  ", hl = theme.tail },
      },
      hl = theme.fill,
    }
  end)
end

return M
