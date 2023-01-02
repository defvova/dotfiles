local M = {}

M.options = {
  auto_clean = true,
  auto_reload_compiled = true,
  compile_on_sync = true,
  git = { clone_timeout = 6000 },
  max_jobs = 50,
  display = {
    working_sym = "ﲊ",
    error_sym = "✗ ",
    done_sym = " ",
    removed_sym = " ",
    moved_sym = "",
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

M.run = function(plugins)
  local present, packer = pcall(require, "packer")

  if not present then
    return
  end

  plugins = require("core.utils").merge_plugins(plugins)

  packer.init(M.options)
  packer.startup { plugins }

  -- packer.startup(function(use)
  --   for _, v in pairs(plugins) do
  --     use(v)
  --   end
  -- end)
end

return M
