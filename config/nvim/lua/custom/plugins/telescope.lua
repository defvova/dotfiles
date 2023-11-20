return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "benfowler/telescope-luasnip.nvim",
    "paopaol/telescope-git-diffs.nvim",
    "tsakirist/telescope-lazy.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
  },
  keys = {
    { "<leader>?", "<cmd>Telescope oldfiles<CR>", desc = "[?] Find recently opened files" },
    { "<leader>b", "<cmd>Telescope buffers<CR>",  desc = "[B] Find existing Buffers" },
    {
      "<leader>/",
      function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
          previewer = false,
        })
      end,
      desc = "[/] Fuzzily search in current buffer",
    },
    { "<leader>f",       "<cmd>Telescope find_files<CR>",                                                       desc = "Search [F]iles" },
    { "<leader><space>", "<cmd>Telescope file_browser<CR>",                                                     desc = "[ ] File Browser" },
    { "<leader>sh",      "<cmd>Telescope help_tags<CR>",                                                        desc = "[S]earch [H]elp" },
    { "<leader>sw",      "<cmd>Telescope grep_string<CR>",                                                      desc = "[S]earch current [W]ord" },
    { "<leader>st",      "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<CR>", desc = "[S]earch [T]ext" },
    { "<leader>sd",      "<cmd>Telescope diagnostics<CR>",                                                      desc = "[S]earch [D]iagnostics" },
    { "<leader>sp",      "<cmd>Telescope projects<CR>",                                                         desc = "[S]earch [P]rojects" },
    { "<leader>ht",      "<cmd>lua require'core.theming.theme_picker'.open_picker()<cr>",                       desc = "Search Theme" },
  },
  opts = function()
    local actions = require "telescope.actions"
    local layout_actions = require "telescope.actions.layout"

    return {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        dynamic_preview_title = true,
        sorting_strategy = "ascending",
        cycle_layout_list = { "flex", "horizontal", "vertical", "bottom_pane", "center" },
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
        },
        history = { path = vim.fn.stdpath "data" .. "/telescope_history.sqlite3" },
        layout_strategy = "flex",
        path_display = { "truncate" },
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        set_env = { ["COLORTERM"] = "truecolor" },
        mappings = {
          i = {
            ["<C-s>"] = actions.select_horizontal,
            ["<C-j>"] = actions.cycle_history_next,
            ["<C-k>"] = actions.cycle_history_prev,
            ["<C-e>"] = layout_actions.toggle_preview,
            ["<C-l>"] = layout_actions.cycle_layout_next,
            ["<C-/>"] = actions.which_key,
            ["<C-r>"] = actions.to_fuzzy_refine,
            -- ["<Tab>"] = actions.toggle_selection,
          },
          n = {
            ["l"] = actions.select_default,
            ["q"] = actions.close,
          },
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
        find_files = {
          -- results_title = false,
          previewer = false,
          layout_config = {
            width = 80,
          },
        },
        oldfiles = {
          -- results_title = false,
          previewer = false,
          layout_config = {
            width = 80,
          },
        },
        live_grep = {
          -- theme = "dropdown",
          theme = "ivy",
        },
        grep_string = {
          theme = "dropdown",
        },
        buffers = {
          theme = "dropdown",
          sort_mru = true,
          sort_lastused = true,
          ignore_current_buffer = true,
          initial_mode = "normal"
        },
      },
      extensions = {
        fzf = {},
        luasnip = {},
        file_browser = {
          theme = "ivy",
          grouped = true,
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          cwd_to_path = true,
          depth = false
        },
        live_grep_args = {
          initial_mode = "normal",
          auto_quoting = true,
          theme = "ivy",
          -- layout_config = { mirror=true }, -- mirror preview pane
        }
      },
    }
  end,
  config = function(_, opts)
    local extensions_list = {
      "fzf",
      -- "git_diffs",
      "file_browser",
      "luasnip",
      "projects",
      "lazy",
      "persisted",
      "live_grep_args"
    }
    local telescope = require "telescope"
    telescope.setup(opts)

    for _, ext in ipairs(extensions_list) do
      telescope.load_extension(ext)
    end
  end,
}
