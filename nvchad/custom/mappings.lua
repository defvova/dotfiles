local M = {}

-- M.disabled = {
--   n = {
--     ["<leader>e"] = "",
--   },
-- }

-- M.truzen = {
--   n = {
--     ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "   truzen ataraxis" },
--     ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "   truzen minimal" },
--     ["<leader>tf"] = { "<cmd> TZFocus <CR>", "   truzen focus" },
--   },
-- }
--
-- M.treesitter = {
--   n = {
--     ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "  find media" },
--   },
-- }

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
  },
}

return M
