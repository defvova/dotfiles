return {
  "ms-jpq/coq_nvim",
  branch = "coq",
  init = function()
    vim.g.coq_settings = { auto_start = true }
  end,
  build = function()
    vim.cmd [[COQdeps]]
  end,
  dependencies = {
    {
      "ms-jpq/coq.artifacts",
      branch = "artifacts",
    },
    {
      "ms-jpq/coq.thirdparty",
      branch = "3p",
      config = function(_, opts)
        require "coq_3p" {
          { src = "nvimlua", short_name = "", conf_only = true },
          { src = "builtin/css" },
          { src = "builtin/html" },
          { src = "builtin/js" },
        }
      end,
    },
  },
  config = function(_, opts)
    vim.g.coq_settings = {
      display = {
        icons = {
          mode = "short",
          spacing = 0,
        },
        pum = {
          source_context = { "", "" },
          kind_context = { "", "" },
        },
      },
      keymap = {
        recommended = true,
        -- manual_complete = "<C-Space>",
        -- jump_to_mark = "<C-j>",
        -- pre_select = true,
      },
    }
  end,
}
