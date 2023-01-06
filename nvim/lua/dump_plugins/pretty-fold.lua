local present, fold = pcall(require, "fold-preview")

if not present then
  return
end

local options = {}

fold.setup(options)
