local present, lazygit = pcall(require, "lazygit")

if not present then
  return
end

local open_floating_window = require("lazygit.window").open_floating_window
local is_lazygit_available = require("lazygit.utils").is_lazygit_available

vim.g.lazygit_use_neovim_remote = 0

LAZYGIT_BUFFER = nil
LAZYGIT_LOADED = false
vim.g.lazygit_opened = 0
local prev_win = -1

local function on_exit(job_id, code, event)
  if code ~= 0 then
    return
  end

  vim.cmd "silent! :q"
  LAZYGIT_BUFFER = nil
  LAZYGIT_LOADED = false
  vim.g.lazygit_opened = 0
  vim.cmd "silent! :checktime"
  if vim.api.nvim_win_is_valid(prev_win) then
    vim.api.nvim_set_current_win(prev_win)
    prev_win = -1
  end
end

local function exec_lazygit_command(cmd)
  if LAZYGIT_LOADED == false then
    -- ensure that the buffer is closed on exit
    vim.g.lazygit_opened = 1
    vim.fn.termopen(cmd, { on_exit = on_exit })
  end
  vim.cmd "startinsert"
end

local function lazygit_branch()
  if is_lazygit_available() ~= true then
    print "Please install lazygit. Check documentation for more information"
    return
  end
  prev_win = vim.api.nvim_get_current_win()
  open_floating_window()
  local cmd = "lazygit branch"
  exec_lazygit_command(cmd)
end

local function lazygit_stash()
  if is_lazygit_available() ~= true then
    print "Please install lazygit. Check documentation for more information"
    return
  end
  prev_win = vim.api.nvim_get_current_win()
  open_floating_window()
  local cmd = "lazygit stash"
  exec_lazygit_command(cmd)
end

local function lazygit_status(path)
  if is_lazygit_available() ~= true then
    print "Please install lazygit. Check documentation for more information"
    return
  end
  prev_win = vim.api.nvim_get_current_win()
  open_floating_window()
  local cmd = "lazygit status"
  exec_lazygit_command(cmd)
end

local function lazygit_log()
  if is_lazygit_available() ~= true then
    print "Please install lazygit. Check documentation for more information"
    return
  end
  prev_win = vim.api.nvim_get_current_win()
  open_floating_window()
  local cmd = "lazygit log"
  exec_lazygit_command(cmd)
end

vim.api.nvim_create_user_command("LazyGitBranch", lazygit_branch, { bang = true })
vim.api.nvim_create_user_command("LazyGitStash", lazygit_stash, { bang = true })
vim.api.nvim_create_user_command("LazyGitStatus", lazygit_status, { bang = true })
vim.api.nvim_create_user_command("LazyGitLog", lazygit_log, { bang = true })
