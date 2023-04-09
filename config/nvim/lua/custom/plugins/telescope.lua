return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "benfowler/telescope-luasnip.nvim",
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
    { "<leader><space>", "<cmd>Telescope buffers<CR>", desc = "[ ] Find existing buffers" },
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
    { "<leader>f", "<cmd>Telescope find_files<CR>", desc = "Search [F]iles" },
    { "<leader>sh", "<cmd>Telescope help_tags<CR>", desc = "[S]earch [H]elp" },
    { "<leader>sw", "<cmd>Telescope grep_string<CR>", desc = "[S]earch current [W]ord" },
    { "<leader>st", "<cmd>Telescope live_grep<CR>", desc = "[S]earch [T]ext" },
    { "<leader>sd", "<cmd>Telescope diagnostics<CR>", desc = "[S]earch [D]iagnostics" },
    { "<leader>sp", "<cmd>Telescope workspaces<CR>", desc = "[S]earch [P]rojects" },
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
            ["<Tab>"] = actions.toggle_selection,
          },
        },
      },
      pickers = {
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
      },
    }
  end,
  config = function(_, opts)
    local extensions_list = {
      "fzf",
      "luasnip",
      "workspaces",
    }
    local telescope = require "telescope"
    local actions = require "telescope.actions"

    opts.defaults.mappings.n = { ["q"] = actions.close }
    telescope.setup(opts)

    for _, ext in ipairs(extensions_list) do
      telescope.load_extension(ext)
    end
  end,
}
