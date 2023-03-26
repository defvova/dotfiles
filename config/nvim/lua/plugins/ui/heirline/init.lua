local conditions = require "heirline.conditions"
local utils = require "heirline.utils"
local M = {}

local function get_hlgroup(name, fallback)
  if vim.fn.hlexists(name) == 1 then
    local hl = vim.api.nvim_get_hl_by_name(name, vim.o.termguicolors)
    if not hl["foreground"] then
      hl["foreground"] = "NONE"
    end
    if not hl["background"] then
      hl["background"] = "NONE"
    end
    hl.fg, hl.bg, hl.sp = hl.foreground, hl.background, hl.special
    hl.ctermfg, hl.ctermbg = hl.foreground, hl.background
    return hl
  end
  return fallback
end

local GitSignsAdd = get_hlgroup("GitSignsAdd", nil) or utils.get_highlight "Constant"
local GitSignsChange = get_hlgroup("GitSignsChange", nil) or utils.get_highlight "Constant"
local GitSignsDelete = get_hlgroup("GitSignsDelete", nil) or utils.get_highlight "Constant"

M.colors = {
  -- bright_bg = utils.get_highlight("Folded").bg,
  -- bright_fg = utils.get_highlight("Folded").fg,
  -- red = utils.get_highlight("DiagnosticError").fg,
  -- dark_red = utils.get_highlight("DiffDelete").bg,
  -- green = utils.get_highlight("String").fg,
  -- blue = utils.get_highlight("Function").fg,
  -- gray = utils.get_highlight("NonText").fg,
  orange = utils.get_highlight("Constant").fg,
  -- purple = utils.get_highlight("Statement").fg,
  -- cyan = utils.get_highlight("Special").fg,
  -- diag_warn = utils.get_highlight("DiagnosticWarn").fg,
  -- diag_error = utils.get_highlight("DiagnosticError").fg,
  -- diag_hint = utils.get_highlight("DiagnosticHint").fg,
  -- diag_info = utils.get_highlight("DiagnosticInfo").fg,
  git_added = GitSignsAdd.fg,
  git_changed = GitSignsChange.fg,
  git_removed = GitSignsDelete.fg,
}

require("heirline").load_colors(M.colors)

local Git = {
  condition = conditions.is_git_repo,

  init = function(self)
    local status_dict = vim.b.gitsigns_status_dict
    local cmd = "git rev-list --left-right --count origin/" .. status_dict.head .. "..." .. status_dict.head
    local status = require("git.utils.git").run_git_cmd(cmd)

    self.status_dict = status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    self.status = status
  end,

  hl = { fg = "orange" },

  { -- git branch name
    provider = function(self)
      return " " .. self.status_dict.head
    end,
    hl = { bold = true },
  },
  {
    provider = function(self)
      return ""
    end,
  },
  -- You could handle delimiters, icons and counts similar to Diagnostics
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = "(",
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and ("+" .. count)
    end,
    hl = { fg = "git_added" },
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and ("-" .. count)
    end,
    hl = { fg = "git_removed" },
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and ("~" .. count)
    end,
    hl = { fg = "git_changed" },
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = ")",
  },
}

M.status_line = {
  Git,
}

return M
