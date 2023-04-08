local theme_mode = require("core.custom").ui.theme_mode

local function kanagawa()
  local spec = require("kanagawa.colors").setup {
    theme = "dragon",
    dimInactive = true,
  }
  vim.opt.background = theme_mode
  vim.cmd "colorscheme kanagawa"

  return {
    accent = spec.crystalBlue,
    accent_sec = spec.winterBlue,
    bg = spec.sumiInk2,
    bg_sec = spec.winterBlue,
    fg = spec.sumiInk0,
    fg_sec = spec.fujiWhite,
    fg3 = spec.crystalBlue,
    fg_cursor_hl = spec.fujiWhite,
    bg_cursor_hl = spec.waveBlue2,
  }
end

local function embark()
  vim.opt.background = "dark" -- set this to dark or light
  vim.cmd "colorscheme embark"

  return {}
end

local function oxocarbon()
  vim.opt.background = "dark" -- set this to dark or light
  vim.cmd "colorscheme oxocarbon"

  return {}
end

local function edge()
  vim.g.edge_enable_italic = 1
  vim.g.edge_better_performance = 1
  vim.opt.background = theme_mode
  vim.cmd "colorscheme edge"

  return {
    accent = "#bf75d6",
    accent_sec = "#dde2e7",
    bg = "#eef1f4",
    bg_sec = "#dde2e7",
    fg = "#fafafa",
    fg_sec = "#4b505b",
    fg3 = "#4b505b",
    fg_cursor_hl = "#fafafa",
    bg_cursor_hl = "#76af6f",
  }
end

local function catppuccin()
  local colors = require("catppuccin.palettes").get_palette()
  vim.cmd "colorscheme catppuccin"
  vim.opt.background = theme_mode

  return {
    accent = colors.maroon,
    accent_sec = "#2F3445",
    bg = "#2F3445",
    bg_sec = colors.base,
    fg = colors.surface0,
    fg_sec = colors.flamingo,
    fg3 = colors.maroon,
    fg_cursor_hl = colors.text,
    bg_cursor_hl = "#506373",
  }
end

local themes = {
  dark = embark,
  light = edge,

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
  palette = themes[theme_mode](),
}

return theme
