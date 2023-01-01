local themes = {
  dark = function()
    vim.cmd "packadd kanagawa.nvim"
    vim.opt.background = "dark"
    vim.cmd "colorscheme kanagawa"
    local spec = require("kanagawa.colors").setup {
      theme = "dragon",
    }
    return {
      accent = "#d65d0e", -- orange
      accent_sec = "#a89984", -- fg4
      bg = spec.bg_search, -- bg1
      bg_sec = "#504945", -- bg2
      fg = spec.fg, -- fg2
      fg_sec = spec.fg_sec, -- fg3
    }
  end,

  light = function()
    vim.cmd "packadd edge"
    vim.opt.background = "light"
    vim.g.edge_enable_italic = 1
    vim.cmd "colorscheme edge"
    return {
      accent = "#bf75d6", -- bg_purple
      accent_sec = "#8790a0", -- grey
      bg = "#eef1f4", -- bg1
      bg_sec = "#dde2e7", -- bg4
      fg = "#33353f", -- default:bg1
      fg_sec = "#4b505b", -- fg
    }
  end,

  -- rose_pine_dawn = function()
  --   vim.cmd('packadd rose-pine')
  --   vim.o.background = 'light'
  --   vim.cmd('colorscheme rose-pine')
  --   return {
  --     accent = '#907aa9', -- Iris
  --     accent_sec = '#d7827e', -- Rose
  --     bg = '#f2e9de', -- bg1
  --     bg_sec = '#e4dfde', -- bg4
  --     fg = '#575279', -- default:bg1
  --     fg_sec = '#6e6a86', -- fg
  --   }
  -- end,
}

local theme = {
  palette = themes[require("core.custom").ui.theme_mode](),
}

return theme
