return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    {
      "nvim-telescope/telescope-project.nvim",
      dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
    },
  },
  keys = {
    { ";", "<cmd> Telescope buffers<CR>", "﬘   open buffers" },
    { "<leader>st", "<cmd> Telescope live_grep <CR>", "   live grep" },
    { "<leader>sK", "<cmd> Telescope keymaps <CR>", "   show keys" },
    { "<leader>sC", "<cmd> Telescope commands <CR>", "   show commands" },
    { "<leader>f", "<cmd> Telescope find_files <CR>", "   find files" },
    { "<leader>sr", "<cmd> Telescope oldfiles <CR>", "   recent files" },
    { "<leader>tT", "<cmd> Telescope themes <CR>", "   themes" },
    { "<leader>sp", "<cmd> Telescope project <CR>", "   show projects" },

    { "<leader>sK", "<cmd> Telescope keymaps <CR>", "   show keys", mode = "v" },
    { "<leader>sC", "<cmd> Telescope commands <CR>", "   show commands", mode = "v" },
  },
  opts = {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "-L",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      -- file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "node_modules" },
      -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
      -- mappings = {
      --   n = { ["q"] = require("telescope.actions").close },
      -- },
    },

    extensions_list = {
      "file_browser",
      "project",
      "themes",
      "terms",
    },
  },
  config = function(_, opts)
    local telescope = require "telescope"
    telescope.setup(opts)
    -- load extensions
    pcall(function()
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end)
  end,
}
