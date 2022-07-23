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
    ["<TAB>"] = "",
    ["<S-Tab>"] = "",
    ["<leader>q"] = "",
    ["<leader>ca"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
    ["<leader>tk"] = "",
    ["<leader>tn"] = "",
    ["<leader>tp"] = "",
    ["<leader>th"] = "",
    ["<leader>ls"] = "",
  },
}

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
    ["q"] = { "<cmd> HopWord<CR>", "hop word" },
    ["<A-cr>"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "   code action menu" },
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
    ["<C-q>"] = { "<cmd> Trouble document_diagnostics<CR>", "   open doc diagnostics" },
  },
  v = {
    ["q"] = { "<cmd> HopWord<CR>", "hop word" },
    ["<A-cr>"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "   code action menu" },
    ["<C-a>"] = { "<ESC> ggVG<CR>", "礪  select all" },
    -- Better indenting
    ["<"] = { "<gv", "   dedent" },
    [">"] = { ">gv", "   indent" },
  },
  x = {
    ["q"] = { "<cmd> HopWord<CR>", "hop word" },
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

M.nvterm = {
  n = {
    ["<leader>th"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "   new horizontal term",
    },

    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "   new vertical term",
    },
  },
}

M.whichkey = {
  n = {
    ["<leader>us"] = { "<cmd> e $MYVIMRC | :cd %:p:h <CR>", "  settings" },
    ["<leader>;"] = { "<cmd> Alpha <CR>", "舘  dashboard" },
    ["<leader>w"] = { "<cmd> w! <CR>", "﬚   save file" },
    ["<leader>d"] = { "<cmd>SymbolsOutline<CR>", "   toggle symbols outline" },
    ["<leader>Sc"] = { "<cmd>lua require('persistence').load()<cr>", "ﭯ   restore last session for current dir" },
    ["<leader>Sl"] = { "<cmd>lua require('persistence').load({ last = true })<cr>", "ﮦ   restore last session" },
    ["<leader>SQ"] = { "<cmd>lua require('persistence').stop()<cr>", "   quit without saving session" },
    ["<leader>sf"] = { "viw<cmd>lua require('spectre').open()<cr>", "﯒   find & replace (Spectre)" },
    ["<leader>sF"] = {
      "viw<cmd>lua require('spectre').open_file_search()<cr>",
      "﯒   replace in current file (Spectre)",
    },
    ["<leader>q"] = { "<cmd>lua require('custom.utils').smart_quit()<CR>", "   quit" },
  },
}

M.tabufline = {
  n = {
    [";"] = { "<cmd> Telescope buffers<CR>", "﬘   open buffers" },
    ["L"] = { "<cmd> Tbufnext <CR>", "  goto next buffer" },
    ["H"] = { "<cmd> Tbufprev <CR> ", "  goto prev buffer" },
  },
}

M.telescope = {
  v = {
    ["<leader>sK"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },
    ["<leader>sC"] = { "<cmd> Telescope commands <CR>", "   show commands" },
  },
  n = {
    ["<leader>st"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
    ["<leader>sK"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },
    ["<leader>sC"] = { "<cmd> Telescope commands <CR>", "   show commands" },
    ["<leader>f"] = { "<cmd> Telescope find_files <CR>", "   find files" },
    ["<leader>so"] = { "<cmd> Telescope oldfiles <CR>", "   recent files" },
    ["<leader>tT"] = { "<cmd> Telescope themes <CR>", "   nvchad themes" },
    ["<leader>sp"] = { "<cmd> Telescope project <CR>", "   show projects" },
  },
}

M.git = {
  n = {
    ["<leader>gd"] = { "<cmd> Gitsigns diffthis HEAD <CR>", "   git diff" },
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
    ["<leader>gC"] = { "<cmd> Telescope git_bcommits <CR>", "   git commits(for current file)" },
    ["<leader>go"] = { "<cmd> Telescope git_status <CR>", "   git status" },
    ["<leader>gO"] = { "<cmd> Telescope git_stash <CR>", "ﱲ   git stash" },
    ["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "   git branches" },
    ["<leader>gp"] = { "<cmd> lua require 'gitsigns'.preview_hunk() <CR>", "   preview hunk" },
    ["<leader>gr"] = { "<cmd> lua require 'gitsigns'.reset_hunk() <CR>", "   reset hunk" },
    ["<leader>gR"] = { "<cmd> lua require 'gitsigns'.reset_buffer() <CR>", "   reset buffer" },
    ["<leader>gs"] = { "<cmd> lua require 'gitsigns'.stage_hunk() <CR>", "樂  stage hunk" },
    ["<leader>gu"] = { "<cmd> lua require 'gitsigns'.undo_stage_hunk() <CR>", "    undo stage hunk" },
  },
}

M.lspconfig = {
  n = {
    ["<leader>lwa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "   add workspace folder",
    },

    ["<leader>lwr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "   remove workspace folder",
    },

    ["<leader>lwl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "   list workspace folders",
    },
  },
}

return M
