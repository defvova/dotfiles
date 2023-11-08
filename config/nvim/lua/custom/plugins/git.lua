return {
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    keys = {
      {
        "<localleader>gs",
        function()
          require("neogit").open()
        end,
        desc = "[G]it [S]tatus buffer",
      },
      {
        "<localleader>gc",
        function()
          require("neogit").open { "commit" }
        end,
        desc = "[G]it [C]ommit buffer",
      },
      {
        "<localleader>gp",
        function()
          require("neogit").popups.pull.create()
        end,
        desc = "[G]it [P]ull popup",
      },
      {
        "<localleader>gP",
        function()
          require("neogit").popups.push.create()
        end,
        desc = "[G]it [P]ush popup",
      },
      {
        "<localleader>gB",
        function()
          require("neogit").open { "branch" }
        end,
        desc = "[G]it [B]ranch popup",
      },
    },
    opts = {
      disable_signs = false,
      disable_hint = true,
      disable_commit_confirmation = true,
      disable_builtin_notifications = true,
      disable_insert_on_commit = false,
      status = {
        recent_commit_count = 100,
      },
      signs = {
        section = { "", "" },
        item = { "▸", "▾" },
        hunk = { "", "" },
      },
      integrations = {
        diffview = true,
      },
    },
    config = function(_, opts)
      require("neogit").setup(opts)
    end,
  },
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
        desc = "[G]it open [L]ine in browser",
      },
      {
        "<leader>gL",
        function()
          require("gitlinker").get_buf_range_url(
            "v",
            { action_callback = require("gitlinker.actions").open_in_browser }
          )
        end,
        desc = "[G]it open [L]ine in browser",
        mode = "x",
      },
      {
        "<leader>gR",
        function()
          require("gitlinker").get_repo_url { action_callback = require("gitlinker.actions").open_in_browser }
        end,
        desc = "[G]it open [R]epo in browser",
      },
    },
  },
  {
    "rbong/vim-flog",
    cmd = { "Flog", "Flogsplit" },
    keys = {
      { "<leader>gf", "<cmd>Flog<CR>", desc = "[F]log" },
    },
    init = function()
      vim.g.flog_default_opts = { max_count = 512 }
      -- vim.g.flog_override_default_mappings = {}
      -- vim.g.flog_jumplist_default_mappings = {}
      vim.g.flog_use_internal_lua = true
    end,
    dependencies = {
      "tpope/vim-fugitive",
      cmd = "Git",
      keys = {
        {
          "<leader>gb",
          "<CMD>Git blame<CR>",
          desc = "[G]it [B]lame",
        },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    keys = {
      { "<leader>hp", "<cmd> Gitsigns preview_hunk<CR>", desc = "[H]unk [P]review" },
      { "<leader>hr", "<cmd> Gitsigns reset_hunk<CR>", desc = "[H]unk [R]eset" },
      { "<leader>hR", "<cmd> Gitsigns reset_buffer<CR>", desc = "[H]unk [R]eset buffer" },
      { "<leader>hs", "<cmd> Gitsigns stage_hunk<CR>", desc = "[H]unk [S]tage" },
      { "<leader>hS", "<cmd> Gitsigns stage_buffer<CR>", desc = "[H]unk [S]tage buffer" },
      { "<leader>hu", "<cmd> Gitsigns undo_stage_hunk<CR>", desc = "[H]unk [U]ndo Stage" },
      { "<leader>hb", "<cmd> Gitsigns blame_line<CR>", desc = "[H]unk [B]lame line" },
    },
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

      vim.keymap.set("x", "<leader>hr", function()
        gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
      end, { desc = "[H]unk [R]eset" })
      vim.keymap.set("x", "<leader>hs", function()
        gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
      end, { desc = "[H]unk [S]tage" })

      vim.keymap.set("n", "[c", function()
        if vim.wo.diff then
          vim.cmd "norm! [c"
        else
          gs.next_hunk()
        end
      end, { desc = "Git Next Hunk" })

      vim.keymap.set("n", "]c", function()
        if vim.wo.diff then
          vim.cmd "norm! ]c"
        else
          gs.prev_hunk()
        end
      end, { desc = "Git Prev Hunk" })

      gs.setup(opts)
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<localleader>gd", "<Cmd>DiffviewOpen<CR>", desc = "[G]it [D]iff", mode = "n" },
      { "gh", [[:'<'>DiffviewFileHistory<CR>]], desc = "[G]it range [H]istory", mode = "v" },
      {
        "<localleader>gh",
        "<Cmd>DiffviewFileHistory<CR>",
        desc = "[G]it [H]istory",
        mode = "n",
      },
      {
        "<localleader>gH",
        "<Cmd>DiffviewFileHistory %<CR>",
        desc = "[G]it file [H]istory",
        mode = "n",
      },
    },
    opts = function()
      local actions = require "diffview.actions"

      return {
        default_args = {
          DiffviewFileHistory = {},
          DiffviewOpen = {},
        },
        show_help_hints = false,
        icons = {
          folder_closed = "",
          folder_open = "",
        },
        file_panel = {
          listing_style = "list",
          win_config = {
            width = 40,
          },
        },
        hooks = {
          diff_buf_read = function(bufnr)
            vim.opt_local.wrap = false
            vim.opt_local.list = false
            vim.opt_local.relativenumber = false
            vim.opt_local.colorcolumn = ""
          end,
        },
        keymaps = {
          view = { q = "<Cmd>DiffviewClose<CR>" },
          file_panel = {
            q = "<Cmd>DiffviewClose<CR>",
            { "n", "<cr>", actions.focus_entry, { desc = "Focus the selected entry" } },
            {
              "n",
              "s",
              actions.toggle_stage_entry,
              { desc = "[S]tage / un[S]tage the selected entry" },
            },
            { "n", "cc", "<Cmd>Git commit <bar> wincmd J<CR>", { desc = "[C]ommit staged [C]hanges" } },
            { "n", "ca", "<Cmd>Git commit --amend <bar> wincmd J<CR>", { desc = "Amend the last commit" } },
            {
              "n",
              "P",
              function()
                require("core.utils").confirm("Confirm git push?", {
                  default = true,
                  callback = function(choice)
                    if choice then
                      vim.cmd "Git push"
                    end
                  end,
                })
              end,
              { desc = "[G]it [P]ush" },
            },
          },
          file_history_panel = {
            q = "<Cmd>DiffviewClose<CR>",
            { "n", "<cr>", actions.focus_entry, { desc = "Focus the selected entry" } },
          },
        },
      }
    end,
    config = function(_, opts)
      require("diffview").setup(opts)
    end,
  },
}