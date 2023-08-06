return {
  "nanozuki/tabby.nvim",
  event = { "BufReadPre", "BufAdd", "BufNewFile" },
  config = function()
    local theme = {
      fill = "TabLineFill",
      head = "TabLine",
      current_tab = "TabLineSel",
      tab = "TabLine",
      win = "TabLine",
      tail = "TabLine",
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
          local filename = tab.name()
          local extension = filename:match "[^.]+$"
          local present, icons = pcall(require, "nvim-web-devicons")
          local icon = present and icons.get_icon(filename, extension) or ""

          local hl = tab.is_current() and theme.current_tab or theme.tab
          return {
            line.sep("", hl, theme.fill),
            -- tab.is_current() and "  " or "  ",
            tab.number(),
            icon,
            filename,
            -- tab.close_btn(' '), -- show a close button
            line.sep("", hl, theme.fill),
            margin = " ",
            hl = hl,
          }
        end),
        -- line.spacer(),
        -- {
        --   line.sep("", theme.tail, theme.fill),
        --   { "  ", hl = theme.tail },
        -- },
        hl = theme.fill,
      }
    end)
  end,
}
