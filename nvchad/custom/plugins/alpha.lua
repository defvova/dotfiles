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

dashboard.section.buttons.val = {
  dashboard.button("SPC f f", "  Find File  ", ":Telescope find_files<CR>"),
  dashboard.button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
  dashboard.button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
  dashboard.button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
  dashboard.button("SPC t h", "  Themes  ", ":Telescope themes<CR>"),
  dashboard.button("SPC e s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
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

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
