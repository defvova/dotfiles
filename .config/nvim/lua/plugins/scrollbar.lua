return {
  'petertriho/nvim-scrollbar',
  lazy = false,
  enabled = false,
  config = function()
    require("scrollbar").setup({
      excluded_buftypes = {
        "terminal",
      },
      excluded_filetypes = {
        "cmp_docs",
        "cmp_menu",
        "noice",
        "prompt",
        "TelescopePrompt",
        "neo-tree"
      },
      handlers = {
        cursor = false,
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns
        handle = true,
        search = false,   -- Requires hlslens
        ale = false,      -- Requires ALE
      },
    })
  end
}
