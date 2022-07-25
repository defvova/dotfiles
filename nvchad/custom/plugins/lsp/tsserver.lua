local M = {}

M.setup = function(options, server)
  local present, typescript = pcall(require, "typescript")

  if not present then
    return
  end

  options.server = vim.tbl_deep_extend("force", options.server or {}, server)
  typescript.setup(options)
end

return M
