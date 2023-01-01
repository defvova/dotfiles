local theme = {
  fill = "TabLineFill",
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = "TabLine",
  current_tab = "TabLineSel",
  -- current_tab = { fg = '#F8FBF6', bg = '#896a98', style = 'italic' },
  tab = "TabLine",
  win = "TabLine",
  tail = "TabLine",
}

vim.opt.showtabline = 2
require("tabby.tabline").set(function(line)
  local cwd = "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
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
        -- tab.number(),
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
