local present, neorg = pcall(require, "neorg")

if not present then
  return
end

-- local icons = require "plugins.icons"

local options = {
  load = {
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          my_workspace = "~/work/neorg",
        },
      },
    },

    -- ["core.norg.concealer"] = {
    --   config = {
    --     icons = {
    --       todo = icons.todo,
    --       list = icons.list,
    --       heading = icons.heading,
    --     },
    --   },
    -- },
  },
}

neorg.setup(options)
