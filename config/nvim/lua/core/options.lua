local opt = vim.opt
local g = vim.g
local custom_config = require "core.custom"
local ui = custom_config.ui

-- g.vim_version = vim.version().minor
g.theme_mode = ui.theme_mode
g.toggle_theme_icon = "   "
-- g.transparency = config.ui.transparency
-- g.theme_switcher_loaded = false

-- g.loaded_netrw = 1
-- g.loaded_netrwPlugin = 1

opt.termguicolors = true

opt.swapfile = false

g.rust_clip_command = "pbcopy"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.laststatus = 3 -- global statusline

opt.title = true
opt.clipboard = "unnamedplus"
opt.cul = true -- cursor line
-- opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.hidden = true -- Enable modified buffers in background

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false
opt.guifont = "FiraCode Nerd Font:h14"

-- disable nvim intro
opt.shortmess:append "sI"

opt.showmode = false -- dont show mode since we have a statusline
opt.spelllang = { "en" }
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.wildignore = "*/cache/*,*/tmp/*"

if vim.fn.has "nvim-0.9.0" == 1 then
  opt.splitkeep = "screen"
  opt.shortmess = "filnxtToOFWIcC"
end

-- disable some builtin vim plugins
local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end

local default_providers = {
  "node",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  g["loaded_" .. provider .. "_provider"] = 0
end
