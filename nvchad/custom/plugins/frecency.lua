local present, _ = pcall(require, "telescope-frecency.nvim")

if not present then
  return
end

local telescope = require "telescope"
telescope.load_extension "frecency"
local options = {
  extensions = {
    frecency = {
      default_workspace = "CWD",
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
      disable_devicons = false,
      workspaces = {
        -- ["conf"] = "/home/my_username/.config",
        -- ["data"] = "/home/my_username/.local/share",
        -- ["project"] = "/home/my_username/projects",
        -- ["wiki"] = "/home/my_username/wiki"
      },
    },
  },
}
-- vim.api.nvim_set_keymap("n", "<leader><leader>p", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})

telescope.setup(options)
