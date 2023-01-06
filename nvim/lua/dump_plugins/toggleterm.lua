local present, toggleterm = pcall(require, "toggleterm")

if not present then
  return
end

local options = {}

toggleterm.setup(options)
