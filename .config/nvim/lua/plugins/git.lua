return {
  {
    "ruifm/gitlinker.nvim",
    keys = {
      {
        "<leader>gL",
        function()
          require("gitlinker").get_buf_range_url(
            "n",
            { action_callback = require("gitlinker.actions").open_in_browser }
          )
        end,
        desc = "[Git]: [G]it open [L]ine in browser",
      },
      {
        "<leader>gL",
        function()
          require("gitlinker").get_buf_range_url(
            "v",
            { action_callback = require("gitlinker.actions").open_in_browser }
          )
        end,
        desc = "[Git]: [G]it open [L]ine in browser",
        mode = "x",
      },
      {
        "<leader>gR",
        function()
          require("gitlinker").get_repo_url { action_callback = require("gitlinker.actions").open_in_browser }
        end,
        desc = "[Git]: [G]it open [R]epo in browser",
      },
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = {
      {
        "<leader>gb",
        "<CMD>Git blame<CR>",
        desc = "[Git]: [G]it [B]lame",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    opts = {
      numhl = true,
      signs = {
        add = {
          text = "┃",
        },
        change = {
          text = "┃",
        },
        delete = {
          show_count = true,
        },
        topdelete = {
          show_count = true,
        },
        changedelete = {
          show_count = false,
          text = "┃",
        },
        untracked = {
          show_count = false,
          text = "┃",
        },
      },
      count_chars = {
        [1] = "₁",
        [2] = "₂",
        [3] = "₃",
        [4] = "₄",
        [5] = "₅",
        [6] = "₆",
        [7] = "₇",
        [8] = "₈",
        [9] = "₉",
        ["+"] = "₊",
      },
    },
    config = function(_, opts)
      local gs = require "gitsigns"
      gs.setup(opts)
    end,
  },
  -- {
  --   "sindrets/diffview.nvim",
  --   cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  --   keys = {
  --     { "<localleader>gd", "<Cmd>DiffviewOpen<CR>",          desc = "[G]it [D]iff",          mode = "n" },
  --     { "gh",              [[:'<'>DiffviewFileHistory<CR>]], desc = "[G]it range [H]istory", mode = "v" },
  --     {
  --       "<localleader>gh",
  --       "<Cmd>DiffviewFileHistory<CR>",
  --       desc = "[G]it [H]istory",
  --       mode = "n",
  --     },
  --     {
  --       "<localleader>gH",
  --       "<Cmd>DiffviewFileHistory %<CR>",
  --       desc = "[G]it file [H]istory",
  --       mode = "n",
  --     },
  --   },
  --   opts = function()
  --     local actions = require "diffview.actions"
  --
  --     return {
  --       default_args = {
  --         DiffviewFileHistory = {},
  --         DiffviewOpen = {},
  --       },
  --       show_help_hints = false,
  --       icons = {
  --         folder_closed = "",
  --         folder_open = "",
  --       },
  --       file_panel = {
  --         listing_style = "list",
  --         win_config = {
  --           width = 40,
  --         },
  --       },
  --       hooks = {
  --         diff_buf_read = function(bufnr)
  --           vim.opt_local.wrap = false
  --           vim.opt_local.list = false
  --           vim.opt_local.relativenumber = false
  --           vim.opt_local.colorcolumn = ""
  --         end,
  --       },
  --       keymaps = {
  --         view = { q = "<Cmd>DiffviewClose<CR>" },
  --         file_panel = {
  --           q = "<Cmd>DiffviewClose<CR>",
  --           { "n", "<cr>", actions.focus_entry,                          { desc = "Focus the selected entry" } },
  --           {
  --             "n",
  --             "s",
  --             actions.toggle_stage_entry,
  --             { desc = "[S]tage / un[S]tage the selected entry" },
  --           },
  --           { "n", "cc",   "<Cmd>Git commit <bar> wincmd J<CR>",         { desc = "[C]ommit staged [C]hanges" } },
  --           { "n", "ca",   "<Cmd>Git commit --amend <bar> wincmd J<CR>", { desc = "Amend the last commit" } },
  --           {
  --             "n",
  --             "P",
  --             function()
  --               require("core.utils").confirm("Confirm git push?", {
  --                 default = true,
  --                 callback = function(choice)
  --                   if choice then
  --                     vim.cmd "Git push"
  --                   end
  --                 end,
  --               })
  --             end,
  --             { desc = "[G]it [P]ush" },
  --           },
  --         },
  --         file_history_panel = {
  --           q = "<Cmd>DiffviewClose<CR>",
  --           { "n", "<cr>", actions.focus_entry, { desc = "Focus the selected entry" } },
  --         },
  --       },
  --     }
  --   end,
  --   config = function(_, opts)
  --     require("diffview").setup(opts)
  --   end,
  -- },
}
