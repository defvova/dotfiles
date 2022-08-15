local present, lualine = pcall(require, "lualine")

if not present then
  return
end

local options = {
  theme = "catppuccin",
  disabled_filetypes = {
    statusline = {},
    winbar = {
      "help",
      "startify",
      "dashboard",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "alpha",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
    },
  },
}

lualine.setup {
  options = options
}
