local present, diff = pcall(require, "diffview.nvim")

if not present then
  return
end

local options = {
  enhanced_diff_hl = true,
  signs = { fold_closed = "", fold_open = "" },
  file_panel = {
    listing_style = "list",
    win_config = {
      width = 45,
    },
  },
}

diff.setup(options)
