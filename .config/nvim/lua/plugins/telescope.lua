return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "benfowler/telescope-luasnip.nvim",
    "paopaol/telescope-git-diffs.nvim",
    "tsakirist/telescope-lazy.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    -- "nvim-telescope/telescope-file-browser.nvim",
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
  init = function()
    local t = require "legendary.toolbox"
    require("legendary").keymaps {
      {
        itemgroup = "Telescope|Search|Grep",
        description = "Gaze deeply into unknown regions using the power of the moon",
        icon = "",
        keymaps = {
          {
            "<leader>f",
            t.lazy_required_fn("telescope.builtin", "find_files", { hidden = true }),
            description = "Search [F]iles",
          },
          {
            "<leader>sg",
            t.lazy_required_fn(
              "telescope.builtin",
              "live_grep",
              { prompt_title = "Open Files", path_display = { "shorten" }, grep_open_files = true }
            ),
            description = "[S]earch [G]rep text",
          },
          {
            "<leader>/",
            t.lazy_required_fn(
              "telescope.builtin",
              "live_grep",
              { prompt_title = "Search CWD", path_display = { "smart" } }
            ),
            description = "[/] Search CWD",
          },
          {
            "<leader>b",
            t.lazy_required_fn(
              "telescope.builtin",
              "buffers",
              { prompt_title = "Buffer List", path_display = { "smart" } }
            ),
            desc = "Find existing [B]uffers",
          },
          {
            "<leader>st",
            "<cmd>lua require'core.theming.theme_picker'.open_picker()<cr>",
            desc = "[S]earch [T]heme",
          },
        },
      },
    }
  end,
  opts = function()
    local actions = require "telescope.actions"
    local layout_actions = require "telescope.actions.layout"

    return {
      defaults = {
        prompt_prefix = "   ",
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
        file_ignore_patterns = { ".git", ".DS_Store", "node_modules", "yarn.lock", "package.lock", "Cargo.lock" },
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
          theme = "ivy",
          -- results_title = false,
          -- previewer = false,
          -- layout_config = {
          --   width = 80,
          -- },
        },
        oldfiles = {
          theme = "ivy",
        },
        live_grep = {
          theme = "ivy",
        },
        grep_string = {
          theme = "ivy",
        },
        lsp_references = {
          theme = "ivy",
          initial_mode = "normal",
        },
        lsp_definitions = {
          theme = "ivy",
          initial_mode = "normal",
        },
        buffers = {
          theme = "dropdown",
          sort_mru = true,
          sort_lastused = true,
          ignore_current_buffer = true,
          initial_mode = "normal",
          mappings = {
            i = {
              ["<c-d>"] = require("telescope.actions").delete_buffer,
            },
            n = {
              ["d"] = require("telescope.actions").delete_buffer,
            },
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        luasnip = {},
        file_browser = {
          theme = "ivy",
          grouped = true,
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          cwd_to_path = true,
          initial_mode = "normal",
          depth = false,
          add_dirs = false,
        },
        lazy = {
          theme = "ivy",
        },
        notify = {
          theme = "ivy",
        },
        live_grep_args = {
          initial_mode = "normal",
          auto_quoting = true,
          theme = "ivy",
          -- layout_config = { mirror=true }, -- mirror preview pane
        },
      },
    }
  end,
  config = function(_, opts)
    local extensions_list = {
      "fzf",
      -- "git_diffs",
      -- "file_browser",
      "luasnip",
      "lazy",
      "persisted",
      "live_grep_args",
      "media_files",
      "notify",
    }
    local telescope = require "telescope"
    telescope.setup(opts)

    for _, ext in ipairs(extensions_list) do
      telescope.load_extension(ext)
    end
  end,
}
