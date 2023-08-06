local M = {
  "karb94/neoscroll.nvim",
  enabled = true,
  event = "BufReadPost",
  keys = { "<C-u>", "<C-d>", "<C-f>", "<C-y>" },
}

function M.config()
  local neoscroll = require "neoscroll"

  local options = {
    -- All these keys will be mapped to their corresponding default scrolling animation
    -- mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
    mappings = { "<C-u>", "<C-d>", "<C-f>", "<C-y>", "zt", "zz", "zb" },
    hide_cursor = true, -- Hide cursor while scrolling
    stop_eof = true, -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil, -- Default easing function
    pre_hook = nil, -- Function to run before the scrolling animation starts
    post_hook = nil, -- Function to run after the scrolling animation ends
  }

  neoscroll.setup(options)

  local t = {}
  t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "85" } }
  t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "85" } }
  -- t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
  t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
  t["<C-y>"] = { "scroll", { "-0.10", "false", "100" } }
  -- t["<C-e>"] = { "scroll", { "0.10", "false", "100" } }
  t["zt"] = { "zt", { "250" } }
  t["zz"] = { "zz", { "250" } }
  t["zb"] = { "zb", { "250" } }

  require("neoscroll.config").set_mappings(t)
end

return M
