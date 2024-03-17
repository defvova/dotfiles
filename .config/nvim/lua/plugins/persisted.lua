return {
  "olimorris/persisted.nvim",
  lazy = false,
  opts = {
    autosave = true,
    autoload = true,
    use_git_branch = true,
    save_dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
    on_autoload_no_session = function()
      vim.notify("No existing session to load.")
    end
  },
  keys = {
    {
      "<leader>Sc",
      [[<cmd>SessionLoad<cr>]],
      desc = "ﭯ   restore last session for current dir",
    },
    {
      "<leader>Sl",
      [[<cmd>SessionLoadLast<cr>]],
      desc = "ﮦ   restore last session",
    },
    {
      "<leader>SS",
      [[<cmd>SessionStop<cr>]],
      desc = "stop saving session",
    },
    {
      "<leader>SD",
      [[<cmd>SessionDelete<cr>]],
      desc = "delete the current session",
    },
    {
      "<leader>Ss",
      [[<cmd>Telescope persisted<cr>]],
      desc = "search session",
    }
  },
}
