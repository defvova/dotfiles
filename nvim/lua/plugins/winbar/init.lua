local M = {}

local navic = require "nvim-navic"
local f = require "plugins.winbar.utils"

local status_web_devicons_ok, web_devicons = pcall(require, "nvim-web-devicons")

local hl_winbar_path = "WinBarPath"
local hl_winbar_file = "WinBarFile"
-- local hl_winbar_symbols = "WinBarSymbols"
local hl_winbar_file_icon = "WinBarFileIcon"

local icons = {
  ui = {
    chevron_right = ">",
    file_icon_default = "",
    seperator = ">",
    editor_state = "●",
    lock_icon = "",
  },
  git = {
    Add = " ",
    Diff = " ",
    Ignore = " ",
    Mod = " ",
    Remove = " ",
    Rename = " ",
    Repo = " ",
  },
}

M.winbar_filetype_exclude = {
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "NvimTree",
  "Trouble",
  "alpha",
  "lir",
  "Outline",
  "spectre_panel",
  "toggleterm",
}

local winbar_file = function()
  local file_path = vim.fn.expand "%:~:.:h"
  local filename = vim.fn.expand "%:t"
  local file_type = vim.fn.expand "%:e"
  local value = ""
  local file_icon = icons.ui.file_icon_default

  file_path = file_path:gsub("^%.", "")
  file_path = file_path:gsub("^%/", "")

  if not f.isempty(filename) then
    local default = false

    if f.isempty(file_type) then
      file_type = ""
      default = true
    end

    if status_web_devicons_ok then
      file_icon = web_devicons.get_icon(filename, file_type, { default = default })
      hl_winbar_file_icon = "DevIcon" .. file_type
    end

    file_icon = "%#" .. hl_winbar_file_icon .. "#" .. (file_icon or icons.ui.file_icon_default) .. " %*"

    value = " "

    local file_path_list = {}
    local _ = string.gsub(file_path, "[^/]+", function(w)
      table.insert(file_path_list, w)
    end)

    for i = 1, #file_path_list do
      value = value .. "%#" .. hl_winbar_path .. "#" .. file_path_list[i] .. " " .. icons.ui.chevron_right .. " %*"
    end

    value = value .. file_icon
    value = value .. "%#" .. hl_winbar_file .. "#" .. filename .. "%*"
  end

  return value
end

local get_modified = function()
  if f.get_buf_option "mod" then
    local mod = icons.git.Mod
    return winbar_file() .. " " .. mod .. "%*"
  end
  return winbar_file() .. "%*"
end

local get_location = function()
  local location = navic.get_location()
  if not f.isempty(location) then
    return "%#WinBarContext#" .. " " .. icons.ui.chevron_right .. " " .. location .. "%*"
  end
  return "%#WinBarContext#" .. " " .. "%*"
end

local excludes = function()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end

  return false
end

-- M.init = function()
--   hl_winbar_path = "MsgArea"
--   hl_winbar_file = "String"
--   hl_winbar_symbols = "Function"
-- end

M.show_winbar = function()
  if excludes() then
    return ""
  end

  -- return "%#WinBarSeparator#" .. "%=" .. "%*" .. get_modified() .. get_location() .. "%#WinBarSeparator#" .. "%*"
  return get_modified() .. get_location() .. "%#WinBarSeparator#" .. "%*"
end

return M
