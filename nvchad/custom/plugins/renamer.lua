local present, renamer = pcall(require, "renamer")

if not present then
  return
end

local options = {}

renamer.setup(options)
