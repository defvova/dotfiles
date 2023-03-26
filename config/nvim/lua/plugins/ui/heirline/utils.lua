local M = { components = {}, env = {}, hl = {} }

local function default_tbl(opts, default)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

local function pad_string(str, padding)
  padding = padding or {}
  return str and str ~= "" and string.rep(" ", padding.left or 0) .. str .. string.rep(" ", padding.right or 0) or ""
end

local function get_icon(kind)
  local icon_pack = vim.g.icons_enabled and "icons" or "text_icons"
  if not astronvim[icon_pack] then
    astronvim.initialize_icons()
  end
  return astronvim[icon_pack] and astronvim[icon_pack][kind] or ""
end

local function stylize(str, opts)
  opts = default_tbl(opts, {
    padding = { left = 0, right = 0 },
    separator = { left = "", right = "" },
    show_empty = false,
    icon = { kind = "NONE", padding = { left = 0, right = 0 } },
  })
  local icon = pad_string(get_icon(opts.icon.kind), opts.icon.padding)
  return str
      and (str ~= "" or opts.show_empty)
      and opts.separator.left .. pad_string(icon .. str, opts.padding) .. opts.separator.right
      or ""
end

M.env.modes = {
  ["n"] = { "NORMAL", "normal" },
  ["no"] = { "OP", "normal" },
  ["nov"] = { "OP", "normal" },
  ["noV"] = { "OP", "normal" },
  ["no"] = { "OP", "normal" },
  ["niI"] = { "NORMAL", "normal" },
  ["niR"] = { "NORMAL", "normal" },
  ["niV"] = { "NORMAL", "normal" },
  ["i"] = { "INSERT", "insert" },
  ["ic"] = { "INSERT", "insert" },
  ["ix"] = { "INSERT", "insert" },
  ["t"] = { "TERM", "terminal" },
  ["nt"] = { "TERM", "terminal" },
  ["v"] = { "VISUAL", "visual" },
  ["vs"] = { "VISUAL", "visual" },
  ["V"] = { "LINES", "visual" },
  ["Vs"] = { "LINES", "visual" },
  [""] = { "BLOCK", "visual" },
  ["s"] = { "BLOCK", "visual" },
  ["R"] = { "REPLACE", "replace" },
  ["Rc"] = { "REPLACE", "replace" },
  ["Rx"] = { "REPLACE", "replace" },
  ["Rv"] = { "V-REPLACE", "replace" },
  ["s"] = { "SELECT", "visual" },
  ["S"] = { "SELECT", "visual" },
  [""] = { "BLOCK", "visual" },
  ["c"] = { "COMMAND", "command" },
  ["cv"] = { "COMMAND", "command" },
  ["ce"] = { "COMMAND", "command" },
  ["r"] = { "PROMPT", "inactive" },
  ["rm"] = { "MORE", "inactive" },
  ["r?"] = { "CONFIRM", "inactive" },
  ["!"] = { "SHELL", "inactive" },
  ["null"] = { "null", "inactive" },
}

M.env.attributes = {
  buffer_active = { bold = true, italic = true },
  buffer_picker = { bold = true },
  macro_recording = { bold = true },
  git_branch = { bold = true },
  git_diff = { bold = true },
}

M.hl.mode_bg = function()
  return M.env.modes[vim.fn.mode()][2]
end

M.hl.get_attributes = function(name, include_bg)
  local hl = M.env.attributes[name] or {}
  hl.fg = name .. "_fg"
  if include_bg then
    hl.bg = name .. "_bg"
  end
  return hl
end

M.components.mode = function(opts)
  opts = default_tbl(opts, {
    mode_text = false,
    paste = false,
    spell = false,
    surround = { separator = "left", color = M.hl.mode_bg },
    hl = M.hl.get_attributes "mode",
    update = "ModeChanged",
  })
end

M.components.git_branch = function(opts)
  return function(self)
    return astronvim.status.utils.stylize(vim.b[self and self.bufnr or 0].gitsigns_head or "", opts)
  end
end

return M
