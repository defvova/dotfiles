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
      desc = "[Session]: Restore last session for current dir",
    },
    {
      "<leader>Sl",
      [[<cmd>SessionLoadLast<cr>]],
      desc = "[Session]: Restore last session",
    },
    {
      "<leader>SS",
      [[<cmd>SessionStop<cr>]],
      desc = "[Session]: Stop saving session",
    },
    {
      "<leader>SD",
      [[<cmd>SessionDelete<cr>]],
      desc = "[Session]: Delete the current session",
    },
    {
      "<leader>Ss",
      [[<cmd>Telescope persisted<cr>]],
      desc = "[Session]: Search session",
    }
  },
}
