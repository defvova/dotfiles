local present, alpha = pcall(require, "alpha")

if not present then
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  [[        /\          /\          /\       ]],
  [[     /\//\\/\    /\//\\/\    /\//\\/\    ]],
  [[  /\//\\\///\\/\//\\\///\\/\//\\\///\\/\ ]],
  [[ //\\\//\/\\///\\\//\/\\///\\\//\/\\///\\]],
  [[ \\//\/                            \/\\//]],
  [[  \/                                  \/ ]],
  [[  /\                                  /\ ]],
  [[ //\\        GLORY TO UKRAINE        //\\]],
  [[ \\//                                \\//]],
  [[  \/                                  \/ ]],
  [[  /\                                  /\ ]],
  [[ //\\/\                            /\//\\]],
  [[ \\///\\/\//\\\///\\/\//\\\///\\/\//\\\//]],
  [[  \/\\///\\\//\/\\///\\\//\/\\///\\\//\/ ]],
  [[      \/\\//\/    \/\\//\/    \/\\//\/   ]],
  [[         \/          \/          \/      ]],
}
dashboard.section.header.opts = {
  position = "center",
  hl = "AlphaHeader",
}

dashboard.section.buttons.val = {
  dashboard.button("SPC f  ", "  Find File  ", ":Telescope find_files<CR>", {}),
  dashboard.button("SPC s o", "  Recent File  ", ":Telescope oldfiles<CR>", {}),
  dashboard.button("SPC s t", "  Find Word  ", ":Telescope live_grep<CR>", {}),
  dashboard.button("SPC s p", "  Recent Projects  ", ":Telescope project<CR>", {}),
  dashboard.button("SPC S l", "缾 Restore last session", ":lua require('persistence').load({ last = true })<CR>", {}),
  dashboard.button("SPC u s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>", {}),
}
dashboard.section.buttons.type = "group"
dashboard.section.buttons.opts = {
  spacing = 1,
}

local function footer()
  -- Number of plugins
  local total_plugins = #vim.tbl_keys(packer_plugins)
  local datetime = os.date "%d-%m-%Y %H:%M:%S"
  local plugins_text = "   "
    .. total_plugins
    .. " plugins"
    .. "   v"
    .. vim.version().major
    .. "."
    .. vim.version().minor
    .. "."
    .. vim.version().patch
    .. "   "
    .. datetime

  -- Quote
  local fortune = require "alpha.fortune"
  local quote = table.concat(fortune(), "\n")

  return plugins_text .. "\n" .. quote
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

alpha.setup(dashboard.opts)
