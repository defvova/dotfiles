-- local options = {
--   auto_clean = true,
--   auto_reload_compiled = true,
--   compile_on_sync = true,
--   git = { clone_timeout = 6000 },
--   max_jobs = 50,
--   display = {
--     working_sym = "ﲊ",
--     error_sym = "✗ ",
--     done_sym = " ",
--     removed_sym = " ",
--     moved_sym = "",
--     open_fn = function()
--       return require("packer.util").float { border = "single" }
--     end,
--   },
-- }

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  defaults = { lazy = true },
  install = { colorscheme = { "kanagawa", "edge" }, missing = true },
  checker = { enabled = false },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  -- debug = true,
})
