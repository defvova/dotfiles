local status_ok, galaxyline = pcall(require, "galaxyline")
if not status_ok then
  return
end

local colors = require("catppuccin.palettes").get_palette()
local condition = require "galaxyline.condition"
local gls = galaxyline.section
galaxyline.short_line_list = { "neo-tree", "lazy" }

local function mode_color(m)
  local mode_colors = {
    n = colors.blue,
    i = colors.green,
    v = colors.mauve,
    [""] = colors.mauve,
    V = colors.mauve,
    c = colors.pink,
    no = colors.blue,
    s = colors.peach,
    S = colors.peach,
    ic = colors.yellow,
    R = colors.red,
    Rv = colors.red,
    cv = colors.blue,
    ce = colors.blue,
    r = colors.peach,
    rm = colors.peach,
    ["r?"] = colors.sapphire,
    ["!"] = colors.blue,
    t = colors.blue,
  }
  return mode_colors[m]
end

local assets = {
  left_separator = "",
  right_separator = "",
  mode_icon = "",
  dir = "",
  file = "",
  lsp = {
    server = "",
    error = "",
    warning = "",
    info = "",
    hint = "",
  },
  git = {
    branch = "",
    added = "",
    changed = "",
    removed = "",
  },
}

local function GetModeColor()
  local m = vim.fn.mode() or vim.fn.visualmode()
  local color = mode_color(m)
  vim.api.nvim_command("hi GalaxyModeColor guibg=" .. color)
  vim.api.nvim_command("hi GalaxyModeColorReverse guifg=" .. color)
  return " "
end

local function CommonCondition()
  local tbl = { ["dashboard"] = true, [""] = true, ["NeoTree"] = true }
  if tbl[vim.bo.filetype] then
    return false
  end
  return true
end

local function GetLeftBracket()
  if vim.bo.filetype == "dashboard" then
    return ""
  else
    return " " .. ""
  end
end

local function GetRightBracket()
  if vim.bo.filetype == "dashboard" then
    return ""
  else
    return "" .. " "
  end
end

local function GetGitBranch()
  if vim.bo.filetype == "dashboard" then
    return ""
  else
    return require("galaxyline.provider_vcs").get_git_branch()
  end
end

local function GetNulllsClient()
  local ft = vim.bo.filetype
  local sources = require("null-ls.sources").get_available(ft)
  local source = ""
  for _, provider in pairs(sources) do
    if string.len(source) < 1 then
      source = source .. provider.name
    else
      source = source .. "," .. provider.name
    end
  end
  return source
end

local function GetLspClient()
  local lsp_clients = require("galaxyline.provider_lsp").get_lsp_client()
  local null_ls_clients = GetNulllsClient()
  if string.len(lsp_clients) > 0 then
    return lsp_clients .. "," .. null_ls_clients
  else
    return null_ls_clients
  end
end

local function LspCondition()
  local lsp_clients = GetLspClient()
  if string.len(lsp_clients) > 1 then
    return true
  else
    return false
  end
end

-- gls.left[1] = {
--   RainbowRed = {
--     provider = function()
--       return "▊ "
--     end,
--     highlight = { colors.blue, colors.bg },
--   },
-- }
local a = 1
gls.left[a] = {
  ModeColor = {
    icon = assets.mode_icon,
    separator = assets.right_separator,
    separator_highlight = "GalaxyModeColorReverse",
    highlight = { colors.bg, mode_color() },
    provider = GetModeColor,
    condition = CommonCondition,
  },
}

a = a + 1
gls.left[a] = {
  GitSectionBracket2 = {
    provider = GetLeftBracket,
    highlight = { colors.green, colors.bg },
    condition = condition.check_git_workspace,
  },
}

-- gls.left[2] = {
--   ViMode = {
--     provider = function()
--       return "  "
--     end,
--     highlight = { colors.red, colors.bg },
--   },
-- }

a = a + 1
gls.left[a] = {
  GitIcon = {
    provider = function()
      if vim.bo.filetype == "dashboard" then
        return ""
      else
        return ""
      end
    end,
    highlight = { colors.bg, colors.green },
    condition = condition.check_git_workspace,
  },
}

-- gls.left[3] = {
--   FileSize = {
--     condition = condition.buffer_not_empty,
--     highlight = { colors.fg, colors.bg },
--     provider = "FileSize",
--   },
-- }

a = a + 1
gls.left[a] = {
  GitBranch = {
    provider = GetGitBranch,
    -- highlight = { colors.fg, colors.gitBg },
    highlight = { colors.red, colors.green },
    condition = condition.check_git_workspace,
  },
}

a = a + 1
gls.left[a] = {
  GitSectionBracket2 = {
    provider = GetRightBracket,
    highlight = { colors.green, colors.gitBg },
    condition = condition.check_git_workspace,
  },
}

-- gls.left[4] = {
--   FileIcon = {
--     condition = condition.buffer_not_empty,
--     highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bg },
--     provider = "FileIcon",
--   },
-- }

-- gls.left[5] = {
--   FileName = {
--     condition = condition.buffer_not_empty,
--     highlight = { colors.fg, colors.bg, "bold" },
--     provider = "FileName",
--   },
-- }

a = a + 1
gls.left[a] = {
  GitSectionExtraSpace = {
    provider = function()
      if vim.bo.filetype == "dashboard" then
        return ""
      else
        return " "
      end
    end,
    highlight = { colors.green, colors.gitBg },
    condition = condition.check_git_workspace,
  },
}

-- gls.left[6] = {
--   LineInfo = {
--     highlight = { colors.fg, colors.bg },
--     provider = "LineColumn",
--     separator = " ",
--     separator_highlight = { "NONE", colors.bg },
--   },
-- }
a = a + 1
gls.left[a] = {
  DiffAdd = {
    provider = "DiffAdd",
    icon = "  ",
    highlight = { colors.green, colors.gitBg },
    condition = condition.check_git_workspace,
  },
}

-- gls.left[7] = {
--   PerCent = {
--     highlight = { colors.fg, colors.bg, "bold" },
--     provider = "LinePercent",
--     separator = " ",
--     separator_highlight = { "NONE", colors.bg },
--   },
-- }
a = a + 1
gls.left[a] = {
  DiffModified = {
    provider = "DiffModified",
    icon = " 柳 ",
    highlight = { colors.yellow, colors.gitBg },
    condition = condition.check_git_workspace,
  },
}

-- gls.left[8] = {
--   DiagnosticError = {
--     highlight = { colors.red, colors.bg },
--     icon = "  ",
--     provider = "DiagnosticError",
--   },
-- }
a = a + 1
gls.left[a] = {
  DiffRemove = {
    provider = "DiffRemove",
    icon = "  ",
    highlight = { colors.red, colors.gitBg },
    condition = condition.check_git_workspace,
  },
}

-- gls.left[9] = {
--   DiagnosticWarn = {
--     highlight = { colors.yellow, colors.bg },
--     icon = "  ",
--     provider = "DiagnosticWarn",
--   },
-- }
a = a + 1
gls.left[a] = {
  GitSectionBracket3 = {
    provider = GetRightBracket,
    highlight = { colors.gitBg, colors.bg },
    condition = condition.check_git_workspace,
  },
}

-- gls.left[10] = {
--   DiagnosticHint = {
--     highlight = { colors.cyan, colors.bg },
--     icon = "  ",
--     provider = "DiagnosticHint",
--   },
-- }
a = a + 1
gls.left[a] = {
  LspSectionBracket1 = {
    provider = GetLeftBracket,
    highlight = { colors.blue, colors.bg },
    condition = LspCondition,
  },
}

-- gls.left[11] = {
--   DiagnosticInfo = {
--     highlight = { colors.blue, colors.bg },
--     icon = "  ",
--     provider = "DiagnosticInfo",
--   },
-- }

a = a + 1
gls.left[a] = {
  LspIcon = {
    provider = function()
      return ""
    end,
    highlight = { colors.bg, colors.blue },
    condition = LspCondition,
  },
}

gls.mid[1] = {
  ShowLspClient = {
    condition = function()
      local tbl = { ["dashboard"] = true, [""] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    highlight = { colors.yellow, colors.bg, "bold" },
    icon = " LSP:",
    provider = "GetLspClient",
  },
}

gls.right[1] = {
  FileEncode = {
    condition = condition.hide_in_width,
    highlight = { colors.green, colors.bg, "bold" },
    provider = "FileEncode",
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
  },
}

gls.right[2] = {
  FileFormat = {
    condition = condition.hide_in_width,
    highlight = { colors.green, colors.bg, "bold" },
    provider = "FileFormat",
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
  },
}

gls.right[3] = {
  GitIcon = {
    provider = function()
      return "  "
    end,
    condition = condition.check_git_workspace,
    highlight = { colors.violet, colors.bg, "bold" },
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
  },
}

gls.right[4] = {
  GitBranch = {
    condition = condition.check_git_workspace,
    highlight = { colors.violet, colors.bg, "bold" },
    provider = "GitBranch",
  },
}

gls.right[5] = {
  Separator = {
    highlight = { colors.fg, colors.bg, "bold" },
    provider = function()
      return " "
    end,
  },
}

gls.right[6] = {
  DiffAdd = {
    condition = condition.hide_in_width,
    highlight = { colors.green, colors.bg },
    icon = "  ",
    provider = "DiffAdd",
  },
}

gls.right[7] = {
  DiffModified = {
    condition = condition.hide_in_width,
    highlight = { colors.orange, colors.bg },
    icon = " 柳",
    provider = "DiffModified",
  },
}

gls.right[8] = {
  DiffRemove = {
    condition = condition.hide_in_width,
    highlight = { colors.red, colors.bg },
    icon = "  ",
    provider = "DiffRemove",
  },
}

gls.right[9] = {
  RainbowBlue = {
    provider = function()
      return " ▊"
    end,
    highlight = { colors.blue, colors.bg },
  },
}

gls.short_line_left[1] = {
  BufferType = {
    highlight = { colors.blue, colors.bg, "bold" },
    provider = "FileTypeName",
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
  },
}

gls.short_line_left[2] = {
  SFileName = {
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg, "bold" },
    provider = "SFileName",
  },
}

gls.short_line_right[1] = {
  BufferIcon = {
    highlight = { colors.fg, colors.bg },
    provider = "BufferIcon",
  },
}
