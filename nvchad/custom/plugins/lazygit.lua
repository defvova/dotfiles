local utils = require "custom.gitroot"

if utils.is_lazygit_available() ~= true then
  print "Please install lazygit. Check documentation for more information"
  return
end

-- _ = utils.project_root_dir()
-- local current_file = vim.fn.expand "%"
local current_file = vim.fn.expand "%:p"

local fterm = require "FTerm"

local lazygit = fterm:new {
  ft = "fterm_lazygit",
  cmd = "lazygit",
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
}

local lazygit_filter = fterm:new {
  ft = "fterm_lazygit",
  cmd = "lazygit -f " .. utils.project_root_dir(),
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
}

local lazygit_filter_current_file = fterm:new {
  ft = "fterm_lazygit",
  cmd = "lazygit -f " .. current_file,
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
}

local lazygit_branch = fterm:new {
  ft = "fterm_lazygit",
  cmd = "lazygit branch",
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
}

local lazygit_stash = fterm:new {
  ft = "fterm_lazygit",
  cmd = "lazygit stash",
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
}

local lazygit_status = fterm:new {
  ft = "fterm_lazygit",
  cmd = "lazygit status",
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
}

local lazygit_log = fterm:new {
  ft = "fterm_lazygit",
  cmd = "lazygit log",
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
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
