local present, refactoring = pcall(require, "refactoring")

if not present then
  return
end

local options = {}

refactoring.setup(options)
