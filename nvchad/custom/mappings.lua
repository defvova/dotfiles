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
    ["<A-k>"] = { "<Esc> <cmd> m .-2<CR>==gi", "   move text up" },
    ["<A-j>"] = { "<Esc> <cmd> m .+1<CR>==gi", "   move text down" },
    ["<C-a>"] = { "<ESC> ggVG<CR>", "礪  select all" },
    ["<A-cr>"] = { "<cmd>Lspsaga code_action<CR>", "   code action menu" },
  },
  n = {
    ["f"] = { "<cmd> HopWord<CR>", "hop word" },
    ["<A-cr>"] = { "<cmd>Lspsaga code_action<CR>", "   code action menu" },
    ["<C-a>"] = { "<ESC> ggVG<CR>", "礪  select all" },
    -- Resize with arrows
    ["<A-Up>"] = { "<cmd> resize -2<CR>", "ﭕ   decrease height" },
    ["<A-Down>"] = { "<cmd> resize +2<CR>", "ﭕ   increase height" },
    ["<A-Left>"] = { "<cmd> vertical resize -2<CR>", "ﭕ   decrease width" },
    ["<A-Right>"] = { "<cmd> vertical resize +2<CR>", "ﭕ   increase width" },

    -- Move current line / block with Alt-j/k a la vscode.
    -- ["<A-j>"] = { "<cmd> m .+1<CR>==", "   move text down" },
    -- ["<A-k>"] = { "<cmd> m .-2<CR>==", "   move text up" },
    ["<A-j>"] = { "<cmd> m .+1<CR>==", "   move text down" },
    ["<A-k>"] = { "<cmd> m .-2<CR>==", "   move text up" },
    -- QuickFix
    -- ["]q"] = { "<cmd> cnext<CR>", "   next error" },
    -- ["[q"] = { "<cmd> cprev<CR>", "   prev error" },
    ["<C-q>"] = { "<cmd> Trouble document_diagnostics<CR>", "   open doc diagnostics" },
  },
  v = {
    ["f"] = { "<cmd> HopWord<CR>", "hop word" },
    ["<A-cr>"] = { "<cmd>Lspsaga code_action<CR>", "   code action menu" },
    ["<C-a>"] = { "<ESC> ggVG<CR>", "礪  select all" },
    -- Better indenting
    ["<"] = { "<gv", "   dedent" },
    [">"] = { ">gv", "   indent" },
  },
  x = {
    ["f"] = { "<cmd> HopWord<CR>", "hop word" },
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "   move text down" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "   move text up" },
    ["<A-cr>"] = { "<cmd><c-u>Lspsaga range_code_action<CR>", "   range code action menu" },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
  },
}

M.nvterm = {
  t = {
    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "   toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "   toggle vertical term",
    },
  },
  n = {
    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "   toggle horizontal term",
    },
    ["<A-v>"] = {
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
    ["<leader>Hr"] = { "<Plug>RestNvim <CR>", "異  run http" },
    ["<leader>Hp"] = { "<Plug>RestNvimPreview <CR>", "   preview http" },
    ["<leader>Hl"] = { "<Plug>RestNvimLast <CR>", "菱  re-run the last http" },

    ["<leader>Tr"] = { "<cmd>lua require('neotest').run.run() <CR>", "ﭧ   run single test" },
    ["<leader>Tl"] = { "<cmd>lua require('neotest').run.run_last() <CR>", "ﭧ   run last test" },
    ["<leader>TR"] = { "<cmd>lua require('neotest').run.run(vim.fn.getcwd()) <CR>", "ﱔ   run all tests" },
    ["<leader>Tf"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%')) <CR>", "   run current file" },
    ["<leader>TS"] = { "<cmd>lua require('neotest').run.stop() <CR>", "栗  stop test" },
    ["<leader>To"] = { "<cmd>lua require('neotest').output.open({ enter = true }) <CR>", "   output of tests" },
    ["<leader>TO"] = {
      "<cmd>lua require('neotest').output.open({ enter = true, short = true }) <CR>",
      "   output of tests",
    },
    ["<leader>Ts"] = { "<cmd>lua require('neotest').summary.toggle() <CR>", "ﱔ   display test suite structure" },
    ["<leader>TA"] = {
      function()
        local neotest = require "neotest"
        for _, adapter_id in ipairs(neotest.run.adapters()) do
          neotest.run.run { suite = true, adapter = adapter_id }
        end
      end,
      "ﱔ   run all adapters",
    },
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
    ["<leader>gc"] = { "<cmd> LazyGitFilter <CR>", "   git commits" },
    ["<leader>gC"] = { "<cmd> LazyGitFilterCurrentFile <CR>", "   git commits(for current file)" },
    ["<leader>gg"] = { "<cmd> LazyGit <CR>", "   git" },
    ["<leader>gS"] = { "<cmd> LazyGitStash <CR>", "ﱲ   git stash" },
    ["<leader>gb"] = { "<cmd> LazyGitBranch <CR>", "   git branches" },
    ["<leader>gs"] = { "<cmd> LazyGitStatus <CR>", "   git status" },
    ["<leader>gl"] = { "<cmd> LazyGitLog <CR>", "   git log" },
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
