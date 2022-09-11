-- n, v, i, t = mode names

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function show_documentation()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    require("lspsaga.hover").render_hover_doc()
  end
end

local M = {}

M.general = {
  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "beginning of line" },
    ["<C-e>"] = { "<End>", "end of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "move left" },
    ["<C-l>"] = { "<Right>", "move right" },
    ["<C-j>"] = { "<Down>", "move down" },
    ["<C-k>"] = { "<Up>", "move up" },

    ["<C-a>"] = { "<ESC> ggVG<CR>", "礪  select all" },
    ["<A-cr>"] = { "<cmd>Lspsaga code_action<CR>", "   code action menu" },
  },

  n = {
    ["<ESC>"] = { "<cmd> noh <CR>", "no highlight" },

    -- switch between windows
    ["<C-h>"] = { "<C-w>h", "window left" },
    ["<C-l>"] = { "<C-w>l", "window right" },
    ["<C-j>"] = { "<C-w>j", "window down" },
    ["<C-k>"] = { "<C-w>k", "window up" },

    -- Copy all
    ["<C-c>"] = { "<cmd> %y+ <CR>", "copy whole file" },

    -- line numbers
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "toggle relative number" },

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },

    -- new buffer
    ["<S-b>"] = { "<cmd> enew <CR>", "new buffer" },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        require("core.utils").close_buffer()
      end,
      "   close buffer",
    },

    ["f"] = { "<cmd> HopWord<CR>", "hop word" },
    ["<A-cr>"] = { "<cmd>Lspsaga code_action<CR>", "   code action menu" },
    ["<C-a>"] = { "<ESC> ggVG<CR>", "礪  select all" },
    -- Resize with arrows
    ["<A-Up>"] = { "<cmd> resize -2<CR>", "ﭕ   decrease height" },
    ["<A-Down>"] = { "<cmd> resize +2<CR>", "ﭕ   increase height" },
    ["<A-Left>"] = { "<cmd> vertical resize -2<CR>", "ﭕ   decrease width" },
    ["<A-Right>"] = { "<cmd> vertical resize +2<CR>", "ﭕ   increase width" },

    -- QuickFix
    -- ["]q"] = { "<cmd> cnext<CR>", "   next error" },
    -- ["[q"] = { "<cmd> cprev<CR>", "   prev error" },
    ["<C-q>"] = { "<cmd> Trouble document_diagnostics<CR>", "   open doc diagnostics" },
    ["L"] = {
      "<cmd> BufferLineCycleNext<CR>",
      "  goto next buffer",
    },
    ["H"] = {
      "<cmd> BufferLineCyclePrev<CR>",
      "  goto prev buffer",
    },
    [";"] = { "<cmd> Telescope buffers<CR>", "﬘   open buffers" },
  },

  t = { ["<C-x>"] = { termcodes "<C-\\><C-N>", "escape terminal mode" } },

  v = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', opts = { silent = true } },

    ["f"] = { "<cmd> HopWord<CR>", "hop word" },
    ["<A-cr>"] = { "<cmd>Lspsaga code_action<CR>", "   code action menu" },
    ["<C-a>"] = { "<ESC> ggVG<CR>", "礪  select all" },
    -- Better indenting
    ["<"] = { "<gv", "   dedent" },
    [">"] = { ">gv", "   indent" },
  },

  x = {
    ["f"] = { "<cmd> HopWord<CR>", "hop word" },
    ["<A-cr>"] = { "<cmd><c-u>Lspsaga range_code_action<CR>", "   range code action menu" },
  },
}

M.comment = {
  -- toggle comment in both modes
  n = {
    ["<leader>/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "   toggle comment",
    },
  },

  v = {
    ["<leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "   toggle comment",
    },
  },
}

M.lspconfig = {
  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
  v = {
    ["<leader>la"] = { "<cmd>lua require('renamer').rename()<CR>", "   lsp rename" },
  },
  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "lsp declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "lsp definition",
    },

    ["K"] = {
      function()
        show_documentation()
      end,
      "lsp hover",
    },

    ["<C-u>"] = { "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", "smart scroll up" },
    ["<C-d>"] = { "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", "smart scroll down" },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },

    -- ["<leader>D"] = {
    --   function()
    --     vim.lsp.buf.type_definition()
    --   end,
    --   "lsp definition type",
    -- },

    ["<leader>la"] = { "<cmd>lua require('renamer').rename()<CR>", "   lsp rename" },

    -- ["<leader>ca"] = {
    --   function()
    --     vim.lsp.buf.code_action()
    --   end,
    --   "lsp code_action",
    -- },

    ["gr"] = { "<cmd>Lspsaga lsp_finder<CR>", "   lsp references" },

    -- ["<leader>f"] = {
    --   function()
    --     vim.diagnostic.open_float()
    --   end,
    --   "floating diagnostic",
    -- },

    -- ["<leader>q"] = {
    --   function()
    --     vim.diagnostic.setloclist()
    --   end,
    --   "diagnostic setloclist",
    -- },

    -- ["<leader>fm"] = {
    --   function()
    --     vim.lsp.buf.formatting {}
    --   end,
    --   "lsp formatting",
    -- },

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

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
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
    ["<leader>sr"] = { "<cmd> Telescope oldfiles <CR>", "   recent files" },
    ["<leader>tT"] = { "<cmd> Telescope themes <CR>", "   themes" },
    ["<leader>sp"] = { "<cmd> Telescope project <CR>", "   show projects" },
    ["<leader>ss"] = { "<cmd>lua require('spectre').open()<cr>", "﯒   find & replace (Spectre)" },
    ["<leader>sS"] = {
      "<cmd>lua require('spectre').open_file_search()<cr>",
      "﯒   replace in current file (Spectre)",
    },
  },
}

M.toggleterm = {
  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      "<cmd> ToggleTerm direction=float<cr>",
      "toggle floating term",
    },

    ["<A-h>"] = {
      "<cmd> ToggleTerm size=40 direction=horizontal<cr>",
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      "<cmd> ToggleTerm size=90 direction=vertical<cr>",
      "toggle vertical term",
    },
  },

  v = {
    ["<A-/>"] = {
      "<cmd> ToggleTermSendVisualLines <cr>",
      "sends all of the (whole) lines",
    },
  },

  -- x = {
  --   ["<A-/>"] = {
  --     "<cmd> ToggleTermSendVisualSelection <cr>",
  --     "sends only the visually selected text",
  --   },
  -- },

  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      "<cmd> ToggleTerm direction=float<cr>",
      "toggle floating term",
    },

    ["<A-h>"] = {
      "<cmd> ToggleTerm size=40 direction=horizontal<cr>",
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      "<cmd> ToggleTerm size=90 direction=vertical<cr>",
      "toggle vertical term",
    },
    ["<A-/>"] = {
      "<cmd> ToggleTermSendCurrentLine<cr>",
      "sends the whole line",
    },
  },
}

M.whichkey = {
  n = {
    ["<leader>tt"] = { "<cmd>lua require('core.utils').toggle_theme()<cr>", "toggle theme" },

    ["<leader>us"] = { "<cmd> e $MYVIMRC | :cd %:p:h <CR>", "  settings" },
    ["<leader>;"] = { "<cmd> Alpha <CR>", "舘  dashboard" },
    ["<leader>w"] = { "<cmd> w! <CR>", "﬚   save file" },
    ["<leader>d"] = { "<cmd>SymbolsOutline<CR>", "   toggle symbols outline" },
    ["<leader>Sc"] = { "<cmd>lua require('persistence').load()<cr>", "ﭯ   restore last session for current dir" },
    ["<leader>Sl"] = { "<cmd>lua require('persistence').load({ last = true })<cr>", "ﮦ   restore last session" },
    ["<leader>SQ"] = { "<cmd>lua require('persistence').stop()<cr>", "   quit without saving session" },
    ["<leader>q"] = { "<cmd>lua require('core.utils').smart_quit()<CR>", "   quit" },
    ["<leader>up"] = { "<cmd> PackerSync <CR>", "異 update plugins" },
    ["<leader>Hr"] = { "<Plug>RestNvim <CR>", "異  run http" },
    ["<leader>Hp"] = { "<Plug>RestNvimPreview <CR>", "   preview http" },
    ["<leader>Hl"] = { "<Plug>RestNvimLast <CR>", "菱  re-run the last http" },

    ["<leader>Tr"] = { "<cmd>lua require('neotest').run.run() <CR>", "ﭧ   run single test" },
    ["<leader>Tl"] = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' }) <CR>", "ﭧ   run last test" },
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
    ["<leader>gD"] = { "<CMD>lua require('git.blame').blame()<CR>", "ﲀ   git blame" },
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

M.crates = {
  n = {
    ["<leader>cd"] = { "<cmd>lua require('crates').open_documentation() <cr>", "open documentation" },
    ["<leader>cr"] = { "<cmd>lua require('crates').open_repository() <cr>", "open repository" },
    ["<leader>ch"] = { "<cmd>lua require('crates').open_homepage() <cr>", "open homepage" },
    ["<leader>cc"] = { "<cmd>lua require('crates').open_crates_io() <cr>", "open crates.io" },
    ["<leader>cu"] = { "<cmd>lua require('crates').update_crate() <cr>", "update crate" },
    ["<leader>ca"] = { "<cmd>lua require('crates').update_all_crates() <cr>", "update all crates" },
    ["<leader>cU"] = { "<cmd>lua require('crates').upgrade_crate() <cr>", "upgrade crate" },
    ["<leader>cA"] = { "<cmd>lua require('crates').upgrade_all_crates() <cr>", "upgrade all crates" },
    ["<leader>ct"] = { "<cmd>lua require('crates').toggle() <cr>", "toggle UI elements" },
    ["<leader>cR"] = { "<cmd>lua require('crates').reload() <cr>", "reload data" },
  },
  v = {
    ["<leader>cu"] = { "<cmd>lua require('crates').update_creates() <cr>", "update crates" },
    ["<leader>cU"] = { "<cmd>lua require('crates').upgrade_crates() <cr>", "upgrade crates" },
  },
}

M.dap = {
  n = {
    ["<leader>Db"] = {
      "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
      "toggle breakpoint",
    },
    ["<leader>Dc"] = {
      "<cmd>lua require'dap'.continue()<cr>",
      "continue",
    },
    ["<leader>Do"] = {
      "<cmd>lua require('dapui').toggle()<cr>",
      "open ui",
    },
  },
}

M.overseer = {
  n = {
    ["<leader>oC"] = { "<cmd>OverseerClose<cr>", "OverseerClose" },
    ["<leader>oa"] = { "<cmd>OverseerTaskAction<cr>", "OverseerTaskAction" },
    ["<leader>ob"] = { "<cmd>OverseerBuild<cr>", "OverseerBuild" },
    ["<leader>oc"] = { "<cmd>OverseerRunCmd<cr>", "OverseerRunCmd" },
    ["<leader>od"] = { "<cmd>OverseerDeleteBundle<cr>", "OverseerDeleteBundle" },
    ["<leader>ol"] = { "<cmd>OverseerLoadBundle<cr>", "OverseerLoadBundle" },
    ["<leader>oo"] = { "<cmd>OverseerOpen!<cr>", "OverseerOpen" },
    ["<leader>oq"] = { "<cmd>OverseerQuickAction<cr>", "OverseerQuickAction" },
    ["<leader>or"] = { "<cmd>OverseerRun<cr>", "OverseerRun" },
    ["<leader>os"] = { "<cmd>OverseerSaveBundle<cr>", "OverseerSaveBundle" },
    ["<leader>ot"] = { "<cmd>OverseerToggle!<cr>", "OverseerToggle" },
  },
}

return M
