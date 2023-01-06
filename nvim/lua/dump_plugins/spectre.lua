local present, spectre = pcall(require, "spectre")

if not present then
  return
end

local options = {
  line_sep_start = "┌--------------------------------------------------------",
  line_sep = "└--------------------------------------------------------",
}

spectre.setup(options)
