return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"

    conform.setup {
      formatters_by_ft = {
        javascript = { { "standardjs" } },
        typescript = { { "standardjs" } },
        -- typescript = { { "prettier", "eslint_d" } },
        javascriptreact = { "standardjs" },
        typescriptreact = { "standardjs" },
        svelte = { "standardjs" },
        css = { "standardjs" },
        html = { "standardjs" },
        json = { { "jq", "standardjs" } },
        yaml = { { "jq", "standardjs" } },
        markdown = { "standardjs" },
        graphql = { "standardjs" },
        liquid = { "standardjs" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        format_after_save = false,
        timeout_ms = 3000,
      },
    }

    require("legendary").keymaps {
      {
        "<leader>mp",
        mode = { "n", "v", "x" },
        function()
          conform.format {
            lsp_fallback = true,
            format_after_save = false,
            timeout_ms = 1000,
          }
        end,
        description = "Format file or range (in visual mode)",
      },
    }
  end,
}
