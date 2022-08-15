-- https://github.com/kdheepak/lazygit.nvim/blob/main/lua/lazygit/utils.lua

local fn = vim.fn

--- Strip leading and lagging whitespace
local function trim(str)
  return str:gsub("^%s+", ""):gsub("%s+$", "")
end

local function get_root()
  local cwd = vim.loop.cwd()
  local status, job = pcall(require, "plenary.job")
  if not status then
    return fn.system "git rev-parse --show-toplevel"
  end

  local gitroot_job = job:new {
    "git",
    "rev-parse",
    "--show-toplevel",
    cwd = cwd,
  }

  local path, code = gitroot_job:sync()
  if code ~= 0 then
    return nil
  end

  return table.concat(path, "")
end

--- Get project_root_dir for git repository
local function project_root_dir()
  -- always use bash on Unix based systems.
  local oldshell = vim.o.shell
  if vim.fn.has "win32" == 0 then
    vim.o.shell = "bash"
  end

  local root = get_root()
  if root == nil then
    return nil
  end

  local cmd =
    string.format('cd "%s" && git rev-parse --show-toplevel', fn.fnamemodify(fn.resolve(fn.expand "%:p"), ":h"), root)
  -- try symlinked file location instead
  local gitdir = fn.system(cmd)
  local isgitdir = fn.matchstr(gitdir, "^fatal:.*") == ""

  if isgitdir then
    vim.o.shell = oldshell
    return trim(gitdir)
  end

  -- revert to old shell
  vim.o.shell = oldshell

  local repo_path = fn.getcwd(0, 0)

  -- just return current working directory
  return repo_path
end

--- Check if lazygit is available
local function is_lazygit_available()
  return fn.executable "lazygit" == 1
end

return {
  get_root = get_root,
  project_root_dir = project_root_dir,
  is_lazygit_available = is_lazygit_available,
}
