local M = {}

M.ui = {
  toggle_mode = { "dark", "light" },
  theme_mode = "dark",
  light_theme = { "edge", "edge" },
  dark_theme = { "kanagawa", "kanagawa.nvim" },
}

M.current_theme = function()
  return vim.g.theme_mode == "light" and M.ui.light_theme[1] or M.ui.dark_theme[1]
end

M.current_packer_theme = function()
  return vim.g.theme_mode == "light" and M.ui.light_theme[2] or M.ui.dark_theme[2]
end

return M
