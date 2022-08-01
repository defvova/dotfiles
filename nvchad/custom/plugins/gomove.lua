local present, gomove = pcall(require, "gomove")

if not present then
  return
end

local options = {}

gomove.setup(options)
