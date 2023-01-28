return {
  "feline-nvim/feline.nvim",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  config = function()
    require("feline").setup {
      components = require("catppuccin.groups.integrations.feline").get(),
    }
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        package.loaded["feline"] = nil
        package.loaded["catppuccin.groups.integrations.feline"] = nil
        require("feline").setup {
          components = require("catppuccin.groups.integrations.feline").get(),
        }
      end,
    })
  end,
}
