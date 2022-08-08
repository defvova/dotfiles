local present, dapui = pcall(require, "dapui")

if not present then
  return
end

local options = {}

dapui.setup(options)
