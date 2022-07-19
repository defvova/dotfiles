local M = {}

M.disabled = {
  n = {
    ["<leader>e"] = "",
    ["<C-s>"] = "",
    ["<leader>wK"] = "",
    ["<leader>wk"] = "",
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",
    ["<leader>bc"] = "",
    ["<leader>v"] = "",
    ["<leader>h"] = "",
    ["<leader>n"] = "",
    ["<leader>ff"] = "",
    ["<leader>fa"] = "",
    ["<leader>fw"] = "",
    ["<leader>fb"] = "",
    ["<leader>fh"] = "",
    ["<leader>fo"] = "",
    ["<leader>fm"] = "",
  },
}

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
M.general = {
  i = {
    -- Move current line / block with Alt-j/k a la vscode.
    ["<A-k>"] = { "<Esc> <cmd> m .-2<CR>==gi", "   move text up" },
    ["<A-j>"] = { "<Esc> <cmd> m .+1<CR>==gi", "   move text down" },
    ["<C-a>"] = { "<ESC> ggVG<CR>", "礪  select all" },
  },
  n = {
    ["<A-cr>"] = { "<cmd> CodeActionMenu<CR>", "   code action menu" },
    [";"] = { "<cmd> Telescope buffers<CR>", "﬘   open buffers" },
    ["<C-a>"] = { "<ESC> ggVG<CR>", "礪  select all" },
    -- Resize with arrows
    ["<A-Up>"] = { "<cmd> resize -2<CR>", "ﭕ   decrease height" },
    ["<A-Down>"] = { "<cmd> resize +2<CR>", "ﭕ   increase height" },
    ["<A-Left>"] = { "<cmd> vertical resize -2<CR>", "ﭕ   decrease width" },
    ["<A-Right>"] = { "<cmd> vertical resize +2<CR>", "ﭕ   increase width" },

    -- Move current line / block with Alt-j/k a la vscode.
    ["<A-j>"] = { "<cmd> m .+1<CR>==", "   move text down" },
    ["<A-k>"] = { "<cmd> m .-2<CR>==", "   move text up" },

    -- QuickFix
    -- ["]q"] = { "<cmd> cnext<CR>", "   next error" },
    -- ["[q"] = { "<cmd> cprev<CR>", "   prev error" },
    ["<C-q>"] = { "<cmd> Trouble quickfix<CR>", "   open quick fix" },
  },
  v = {
    ["<A-cr>"] = { "<cmd> CodeActionMenu<CR>", "   code action menu" },
    ["<C-a>"] = { "<ESC> ggVG<CR>", "礪  select all" },
    -- Better indenting
    ["<"] = { "<gv", "   dedent" },
    [">"] = { ">gv", "   indent" },
  },
  x = {
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "   move text down" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "   move text up" },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
  },
}

M.whichkey = {
  n = {
    ["<leader>;"] = { "<cmd> Alpha <CR>", "舘  dashboard" },
    ["<leader>w"] = { "<cmd> w <CR>", "﬚   save file" },
    ["<leader>d"] = { "<cmd>SymbolsOutline<CR>", "   toggle symbols outline" },
    ["<leader>Sc"] = { "<cmd>lua require('persistence').load()<cr>", "ﭯ   restore last session for current dir" },
    ["<leader>Sl"] = { "<cmd>lua require('persistence').load({ last = true })<cr>", "ﮦ   restore last session" },
    ["<leader>SQ"] = { "<cmd>lua require('persistence').stop()<cr>", "   quit without saving session" },
    ["<leader>sf"] = { "viw<cmd>lua require('spectre').open()<cr>", "﯒   find & replace (Spectre)" },
    ["<leader>sF"] = {
      "viw<cmd>lua require('spectre').open_file_search()<cr>",
      "﯒   replace in current file (Spectre)",
    },
    ["<leader>st"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
    ["<leader>sK"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },
    ["<leader>sC"] = { "<cmd> Telescope commands <CR>", "   show commands" },
  },
  v = {
    ["<leader>sK"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },
    ["<leader>sC"] = { "<cmd> Telescope commands <CR>", "   show commands" },
  },
}

M.telescope = {
  n = {
    ["<leader>f"] = { "<cmd> Telescope find_files <CR>", "   find files" },
  },
}
return M
