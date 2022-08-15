local M = {}

function M.setup()
  local dap = require "dap"
  -- local port = 13000
  -- local install_root_dir = vim.fn.stdpath "data" .. "/mason"
  -- local extension_path = install_root_dir .. "/packages/codelldb/extension/"
  -- local codelldb_path = extension_path .. "adapter/codelldb"
  --
  -- dap.adapters.codelldb = {
  --   type = "server",
  --   host = "127.0.0.1",
  --   port = port,
  --   executable = {
  --     command = codelldb_path,
  --     args = { "--port", port },
  --   },
  -- }
  --
  -- dap.configurations.rust = {
  --   {
  --     name = "Launch file",
  --     type = "codelldb",
  --     request = "launch",
  --     program = function()
  --       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
  --     end,
  --     cwd = "${workspaceFolder}",
  --     stopOnEntry = true,
  --   },
  -- }

  local lldb_host = "127.0.0.1"
  local lldb_port = 34567

  dap.configurations.rust = {
    {
      name = "Debug",
      type = "lldb",
      request = "launch",
      host = lldb_host,
      port = lldb_port,
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
    },
  }

  dap.adapters.lldb = function(callback, config)
    callback { type = "server", host = config.host, port = config.port }
  end
end

return M
