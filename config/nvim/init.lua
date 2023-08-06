--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require "core.lazy"
require("core.theming.themes").activate_theme("nightowl", "night-owl", false)
