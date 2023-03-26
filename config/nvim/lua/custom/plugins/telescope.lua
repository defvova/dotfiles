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
    {
      "nvim-telescope/telescope-project.nvim",
      dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
    },
  },
  keys = {
    { "<leader>?",       "<cmd>Telescope oldfiles<CR>", desc = "[?] Find recently opened files" },
    { "<leader><space>", "<cmd>Telescope buffers<CR>",  desc = "[ ] Find existing buffers" },
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
    { "<leader>f",  "<cmd>Telescope find_files<CR>",  desc = "Search [F]iles" },
    { "<leader>sh", "<cmd>Telescope help_tags<CR>",   desc = "[S]earch [H]elp" },
    { "<leader>sw", "<cmd>Telescope grep_string<CR>", desc = "[S]earch current [W]ord" },
    { "<leader>st", "<cmd>Telescope live_grep<CR>",   desc = "[S]earch [T]ext" },
    { "<leader>sd", "<cmd>Telescope diagnostics<CR>", desc = "[S]earch [D]iagnostics" },
    { "<leader>sp", "<cmd>Telescope project<CR>",     desc = "[S]earch [P]rojects" },
  },
  opts = {
    defaults = {
      prompt_prefix = "   ",
      selection_caret = "  ",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
        },
      },
      path_display = { "truncate" },
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      set_env = { ["COLORTERM"] = "truecolor" },
      mappings = {
        i = {
          ["<C-u>"] = false,
          ["<C-d>"] = false,
        },
      },
    },
    pickers = {
      find_files = {
        results_title = false,
        previewer = false,
        layout_config = {
          width = 80,
        },
      },
      oldfiles = {
        results_title = false,
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
  },
  config = function(_, opts)
    local extensions_list = {
      "file_browser",
      "project",
      "fzf",
      "luasnip",
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
