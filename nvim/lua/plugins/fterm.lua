local present, fterm = pcall(require, "fterm")

if not present then
  return
end

local options = {}

fterm.setup(options)
