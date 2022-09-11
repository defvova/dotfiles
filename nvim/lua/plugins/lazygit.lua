local utils = require "core.gitroot"

if utils.is_lazygit_available() ~= true then
  print "Please install lazygit. Check documentation for more information"
  return
end

-- _ = utils.project_root_dir()
-- local current_file = vim.fn.expand "%"
local current_file = vim.fn.expand "%:p"

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new {
  cmd = "lazygit",
  direction = "float",
  hidden = true,
}

local lazygit_filter = Terminal:new {
  cmd = "lazygit -f " .. utils.project_root_dir(),
  direction = "float",
  hidden = true,
}

-- FIXME: doesnt work
local lazygit_filter_current_file = Terminal:new {
  cmd = "lazygit -f " .. current_file,
  direction = "float",
  hidden = true,
}

local lazygit_branch = Terminal:new {
  cmd = "lazygit branch",
  direction = "float",
  hidden = true,
}

local lazygit_stash = Terminal:new {
  cmd = "lazygit stash",
  direction = "float",
  hidden = true,
}

local lazygit_status = Terminal:new {
  cmd = "lazygit status",
  direction = "float",
  hidden = true,
}

local lazygit_log = Terminal:new {
  cmd = "lazygit log",
  direction = "float",
  hidden = true,
}

vim.api.nvim_create_user_command("LazyGit", function()
  lazygit:toggle()
end, { bang = true })
vim.api.nvim_create_user_command("LazyGitFilter", function()
  lazygit_filter:toggle()
end, { bang = true })
vim.api.nvim_create_user_command("LazyGitFilterCurrentFile", function()
  lazygit_filter_current_file:toggle()
end, { bang = true })
vim.api.nvim_create_user_command("LazyGitBranch", function()
  lazygit_branch:toggle()
end, { bang = true })
vim.api.nvim_create_user_command("LazyGitStash", function()
  lazygit_stash:toggle()
end, { bang = true })
vim.api.nvim_create_user_command("LazyGitStatus", function()
  lazygit_status:toggle()
end, { bang = true })
vim.api.nvim_create_user_command("LazyGitLog", function()
  lazygit_log:toggle()
end, { bang = true })
