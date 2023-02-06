local M = {}
local api = vim.api
local fn = vim.fn
local g = vim.g

local merge_tb = vim.tbl_deep_extend

M.smart_quit = function()
  local bufnr = api.nvim_get_current_buf()
  local modified = api.nvim_buf_get_option(bufnr, "modified")
  if modified then
    vim.ui.input({
      prompt = "You have unsaved changes. Quit anyway? (y/n) ",
    }, function(input)
      if input == "y" then
        vim.cmd "q!"
      end
    end)
  else
    vim.cmd "q!"
  end
end

M.file = function(mode, filepath, content)
  local data
  local base_dir = fn.fnamemodify(filepath, ":h")
  -- check if file exists in filepath, return false if not
  if mode == "r" and fn.filereadable(filepath) == 0 then
    return false
  end
  -- check if directory exists, create it and all parents if not
  if mode == "w" and fn.isdirectory(base_dir) == 0 then
    fn.mkdir(base_dir, "p")
  end
  local fd = assert(vim.loop.fs_open(filepath, mode, 438))
  local stat = assert(vim.loop.fs_fstat(fd))
  if stat.type ~= "file" then
    data = false
  else
    if mode == "r" then
      data = assert(vim.loop.fs_read(fd, stat.size, 0))
    else
      assert(vim.loop.fs_write(fd, content, 0))
      data = true
    end
  end
  assert(vim.loop.fs_close(fd))
  return data
end

M.write_data = function(old_data, new_data)
  local file_fn = M.file
  local file = fn.stdpath "config" .. "/lua/core/" .. "custom.lua"
  local data = file_fn("r", file)

  local content = string.gsub(data, old_data, new_data)

  -- see if the find string exists in file
  assert(file_fn("w", file, content))
end

M.change_theme = function(current_theme, new_theme)
  if current_theme == nil or new_theme == nil then
    print "Error: Provide current and new theme name"
    return false
  end

  if current_theme == new_theme then
    return
  end

  -- escape characters which can be parsed as magic chars
  current_theme = current_theme:gsub("%p", "%%%0")
  new_theme = new_theme:gsub("%p", "%%%0")

  local old_theme_txt = "theme_mode = .?" .. current_theme .. ".?"
  local new_theme_txt = 'theme_mode = "' .. new_theme .. '"'

  M.write_data(old_theme_txt, new_theme_txt)
end

M.reload_theme = function(mode)
  vim.opt.background = mode
  vim.cmd("colorscheme " .. require("core.custom").current_theme())
end

M.toggle_theme = function()
  local themes = require("core.custom").ui.toggle_mode

  local theme1 = themes[1]
  local theme2 = themes[2]

  if g.theme_mode == theme1 or g.theme_mode == theme2 then
    if g.toggle_theme_icon == "   " then
      g.toggle_theme_icon = "   "
    else
      g.toggle_theme_icon = "   "
    end
  end

  if g.theme_mode == theme1 then
    g.theme_mode = theme2

    M.change_theme(theme1, theme2)
    M.reload_theme(theme2)
  elseif g.theme_mode == theme2 then
    g.theme_mode = theme1

    M.change_theme(theme2, theme1)
    M.reload_theme(theme1)
  else
    vim.notify "Set your current theme to one of those mentioned in the toggle_mode table (chadrc)"
  end
end

return M
