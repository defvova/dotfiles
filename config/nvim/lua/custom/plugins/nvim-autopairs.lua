return {
  "windwp/nvim-autopairs",
  opts = {
    fast_wrap = {},
    check_ts = true,
    disable_filetype = { "TelescopePrompt", "vim" },
  },
  event = "InsertEnter",
  config = function(_, opts)
    local autopairs = require "nvim-autopairs"
    autopairs.setup(opts)

    local cmp = require "cmp"
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
