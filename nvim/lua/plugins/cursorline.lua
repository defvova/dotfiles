local present, cursor = pcall(require, "nvim-cursorline")

if not present then
  return
end

local options = {
  cursorline = {
    enable = false,
  },
  cursorword = {
    enable = true,
    min_length = 2,
    hl = { underline = true },
  },
}

cursor.setup(options)
