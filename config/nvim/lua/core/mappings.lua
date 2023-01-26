-- n, v, i, t = mode names

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- local function rename()
--   if pcall(require, "inc_rename") then
--     return ":IncRename " .. vim.fn.expand "<cword>"
--   else
--     vim.lsp.buf.rename()
--   end
-- end

local function show_documentation()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    require("lspsaga.hover"):render_hover_doc()
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
    ["tt"] = { "<cmd>$tabnew<CR>", "new tab" },
    ["<C-S-h>"] = { "<cmd>-tabmove<CR>", "move current tab to prev position" },
    ["<C-S-l>"] = { "<cmd>+tabmove<CR>", "move current tab to next position" },

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
    ["L"] = {
      "<cmd> tabn<CR>",
      "  goto next tab",
    },
    ["H"] = {
      "<cmd> tabp<CR>",
      "  goto prev tab",
    },
    ["<leader>Fc"] = {
      function()
        require("core.cht").cht()
      end,
      "  Cheatsheets",
    },
    ["<leader>Fs"] = {
      function()
        require("core.cht").stack_overflow()
      end,
      "  Stack Overflow",
    },
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

    ["<A-cr>"] = { "<cmd>Lspsaga code_action<CR>", "   code action menu" },
    ["<C-a>"] = { "<ESC> ggVG<CR>", "礪  select all" },
    -- Better indenting
    ["<"] = { "<gv", "   dedent" },
    [">"] = { ">gv", "   indent" },
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

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },

    ["<leader>la"] = { "<cmd>lua require('renamer').rename()<CR>", "   lsp rename" },

    ["gr"] = { "<cmd>Lspsaga lsp_finder<CR>", "   lsp references" },

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
    ["<leader>q"] = { "<cmd>lua require('core.utils').smart_quit()<CR>", "   quit" },
    ["<leader>up"] = { "<cmd> Lazy sync <CR>", "異 update plugins" },
  },
}

M.git = {
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

return M
