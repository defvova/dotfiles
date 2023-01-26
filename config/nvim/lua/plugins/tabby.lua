return {
  "nanozuki/tabby.nvim",
  event = "BufReadPre",
  config = function()
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
