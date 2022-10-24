local M = {}
local api = vim.api
local fn = vim.fn
local g = vim.g

local merge_tb = vim.tbl_deep_extend

M.setup_auto_format = function(ft, command)
  if not command then
    command = "lua vim.lsp.buf.formatting_sync()"
  end
  -- vim.cmd(string.format("autocmd BufWritePost *.%s %s", ft, command))
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = string.format("*.%s", ft),
    command = command,
  })
end

M.smart_quit = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
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

M.remove_disabled_keys = function(maps, default_mappings)
  if not maps then
    return default_mappings
  end

  -- store keys in a array with true value to compare
  local keys_to_disable = {}
  for _, mappings in pairs(maps) do
    for mode, section_keys in pairs(mappings) do
      if not keys_to_disable[mode] then
        keys_to_disable[mode] = {}
      end
      section_keys = (type(section_keys) == "table" and section_keys) or {}
      for k, _ in pairs(section_keys) do
        keys_to_disable[mode][k] = true
      end
    end
  end

  -- make a copy as we need to modify default_mappings
  for section_name, section_mappings in pairs(default_mappings) do
    for mode, mode_mappings in pairs(section_mappings) do
      mode_mappings = (type(mode_mappings) == "table" and mode_mappings) or {}
      for k, _ in pairs(mode_mappings) do
        -- if key if found then remove from default_mappings
        if keys_to_disable[mode] and keys_to_disable[mode][k] then
          default_mappings[section_name][mode][k] = nil
        end
      end
    end
  end

  return default_mappings
end

M.load_mappings = function(section, mapping_opt)
  local function set_section_map(section_values)
    for mode, mode_values in pairs(section_values) do
      local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
      for keybind, mapping_info in pairs(mode_values) do
        -- merge default + user opts
        local opts = merge_tb("force", default_opts, mapping_info.opts or {})

        mapping_info.opts, opts.mode = nil, nil
        opts.desc = mapping_info[2]

        vim.keymap.set(mode, keybind, mapping_info[1], opts)
      end
    end
  end

  local mappings = require "core.mappings"

  if type(section) == "string" then
    mappings = { mappings[section] }
  end

  for _, sect in pairs(mappings) do
    set_section_map(sect)
  end
end

M.merge_plugins = function(default_plugins)
  local final_table = {}

  for key, _ in pairs(default_plugins) do
    default_plugins[key][1] = key
    final_table[#final_table + 1] = default_plugins[key]
  end

  return final_table
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
  local file = fn.stdpath "config" .. "/lua/core/" .. "theme.lua"
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

M.reload_theme = function()
  vim.cmd("set background=" .. g.theme_mode)
end

M.toggle_theme = function()
  local themes = require("core.theme").ui.toggle_mode

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

    M.reload_theme()
    M.change_theme(theme1, theme2)
  elseif g.theme_mode == theme2 then
    g.theme_mode = theme1

    M.reload_theme()
    M.change_theme(theme2, theme1)
  else
    vim.notify "Set your current theme to one of those mentioned in the toggle_mode table (chadrc)"
  end
end

M.get_buf_option = function(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

return M
