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
  },
  keys = {
    { "<leader>?", "<cmd>Telescope oldfiles<CR>", desc = "[?] Find recently opened files" },
    { "<leader>bb", "<cmd>Telescope buffers<CR>", desc = "[B] Find existing [B]uffers" },
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
    { "<leader><space>", "<cmd>Telescope find_files<CR>", desc = "[ ] Search Files" },
    { "<leader>sh", "<cmd>Telescope help_tags<CR>", desc = "[S]earch [H]elp" },
    { "<leader>sw", "<cmd>Telescope grep_string<CR>", desc = "[S]earch current [W]ord" },
    { "<leader>st", "<cmd>Telescope live_grep<CR>", desc = "[S]earch [T]ext" },
    { "<leader>sd", "<cmd>Telescope diagnostics<CR>", desc = "[S]earch [D]iagnostics" },
    { "<leader>sp", "<cmd>Telescope projects<CR>", desc = "[S]earch [P]rojects" },
    { "<leader>ht", "<cmd>lua require'core.theming.theme_picker'.open_picker()<cr>", desc = "Search Theme" },
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
          theme = "dropdown",
        },
        grep_string = {
          theme = "dropdown",
        },
        buffers = {
          theme = "dropdown",
        },
      },
      extensions = {
        fzf = {},
        luasnip = {},
        file_browser = {
          theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
        },
      },
    }
  end,
  config = function(_, opts)
    local extensions_list = {
      "fzf",
      "git_diffs",
      -- "file_browser",
      "luasnip",
      "projects",
      "lazy",
    }
    local telescope = require "telescope"
    telescope.setup(opts)

    for _, ext in ipairs(extensions_list) do
      telescope.load_extension(ext)
    end

    local file_browser = require("telescope").load_extension "file_browser"
    require("telescope.builtin").file_browser = file_browser.file_browser
  end,
}
