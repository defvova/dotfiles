local M = {}

M.disabled = {
  t = {
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  },
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
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["K"] = "",
    ["<leader>pt"] = "",
    ["gr"] = "",
    ["<leader>ra"] = "",
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
    ["<D-k>"] = { "<Esc> <cmd> m .-2<CR>==gi", "   move text up" },
    ["<D-j>"] = { "<Esc> <cmd> m .+1<CR>==gi", "   move text down" },
    ["<C-a>"] = { "<ESC> ggVG<CR>", "礪  select all" },
    ["<C-=>"] = { "<cmd> lua require('custom.utils').resize_gui_font(1)<CR>", "increase font size" },
    ["<C-->"] = { "<cmd> lua require('custom.utils').resize_gui_font(-1)<CR>", "decrease font size" },
    ["<C-0>"] = { "<cmd> lua require('custom.utils').reset_gui_font()<CR>", "reset font" },
    ["<D-cr>"] = { "<cmd>Lspsaga code_action<CR>", "   code action menu" },
  },
  n = {
    ["<C-=>"] = { "<cmd> lua require('custom.utils').resize_gui_font(1)<CR>", "increase font size" },
    ["<C-->"] = { "<cmd> lua require('custom.utils').resize_gui_font(-1)<CR>", "decrease font size" },
    ["<C-0>"] = { "<cmd> lua require('custom.utils').reset_gui_font()<CR>", "reset font" },
    ["f"] = { "<cmd> HopWord<CR>", "hop word" },
    ["<D-cr>"] = { "<cmd>Lspsaga code_action<CR>", "   code action menu" },
    ["<C-a>"] = { "<ESC> ggVG<CR>", "礪  select all" },
    -- Resize with arrows
    ["<D-Up>"] = { "<cmd> resize -2<CR>", "ﭕ   decrease height" },
    ["<D-Down>"] = { "<cmd> resize +2<CR>", "ﭕ   increase height" },
    ["<D-Left>"] = { "<cmd> vertical resize -2<CR>", "ﭕ   decrease width" },
    ["<D-Right>"] = { "<cmd> vertical resize +2<CR>", "ﭕ   increase width" },

    -- Move current line / block with Alt-j/k a la vscode.
    -- ["<A-j>"] = { "<cmd> m .+1<CR>==", "   move text down" },
    -- ["<A-k>"] = { "<cmd> m .-2<CR>==", "   move text up" },
    ["<D-j>"] = { "<cmd> m .+1<CR>==", "   move text down" },
    ["<D-k>"] = { "<cmd> m .-2<CR>==", "   move text up" },
    -- QuickFix
    -- ["]q"] = { "<cmd> cnext<CR>", "   next error" },
    -- ["[q"] = { "<cmd> cprev<CR>", "   prev error" },
    ["<C-q>"] = { "<cmd> Trouble document_diagnostics<CR>", "   open doc diagnostics" },
  },
  v = {
    ["f"] = { "<cmd> HopWord<CR>", "hop word" },
    ["<D-cr>"] = { "<cmd>Lspsaga code_action<CR>", "   code action menu" },
    ["<C-a>"] = { "<ESC> ggVG<CR>", "礪  select all" },
    -- Better indenting
    ["<"] = { "<gv", "   dedent" },
    [">"] = { ">gv", "   indent" },
  },
  x = {
    ["f"] = { "<cmd> HopWord<CR>", "hop word" },
    -- Move current line / block with Alt-j/k ala vscode.
    ["<D-j>"] = { ":m '>+1<CR>gv=gv", "   move text down" },
    ["<D-k>"] = { ":m '<-2<CR>gv=gv", "   move text up" },
    ["<D-cr>"] = { "<cmd><c-u>Lspsaga range_code_action<CR>", "   range code action menu" },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
  },
}

M.nvterm = {
  t = {
    ["<D-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "   toggle horizontal term",
    },

    ["<D-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "   toggle vertical term",
    },
  },
  n = {
    ["<D-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "   toggle horizontal term",
    },
    ["<D-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "   toggle vertical term",
    },

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
    ["<leader>up"] = { "<cmd> PackerSync <CR>", "異 update plugins" },
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
  v = {
    ["<leader>gY"] = {
      function()
        -- require("gitlinker.actions").copy_to_clipboard()
        require("gitlinker").get_buf_range_url("v", { action_callback = require("gitlinker.actions").open_in_browser })
      end,
      "   open lines in browser",
    },
  },
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
    ["<leader>gu"] = { "<cmd> lua require 'gitsigns'.undo_stage_hunk() <CR>", "   undo stage hunk" },
    ["<leader>gY"] = {
      function()
        -- require("gitlinker.actions").copy_to_clipboard()
        require("gitlinker").get_buf_range_url("n", { action_callback = require("gitlinker.actions").open_in_browser })
      end,
      "   open line in browser",
    },
    ["<leader>gB"] = {
      function()
        require("gitlinker").get_repo_url { action_callback = require("gitlinker.actions").open_in_browser }
      end,
      "   open repo in browser",
    },
  },
}

M.lspconfig = {
  n = {
    ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "   lsp hover" },
    ["gr"] = { "<cmd>Lspsaga lsp_finder<CR>", "   lsp references" },
    ["<leader>la"] = { "<cmd>Lspsaga rename<CR>", "   lsp rename" },
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
