local present, numb = pcall(require, "numb")

if not present then
  return
end

local options = {
  show_numbers = true, -- Enable 'number' for the window while peeking
  show_cursorline = true, -- Enable 'cursorline' for the window while peeking
}

numb.setup(options)
