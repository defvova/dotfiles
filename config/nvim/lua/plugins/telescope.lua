return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
    extensions = {
      fzf = {
        fuzzy = false,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
    defaults = {
      prompt_prefix = "   ",
      selection_caret = "  ",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
        },
      },
      file_ignore_patterns = { "node_modules", ".git" },
      path_display = { "truncate" },
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      set_env = { ["COLORTERM"] = "truecolor" },
      mappings = {},
    },
  },
  config = function(_, opts)
    local extensions_list = {
      "file_browser",
      "project",
      "fzf",
      "noice",
    }
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local previewers = require "telescope.previewers"
    local sorters = require "telescope.sorters"

    opts.defaults.file_previewer = previewers.vim_buffer_cat.new
    opts.defaults.grep_previewer = previewers.vim_buffer_vimgrep.new
    opts.defaults.qflist_previewer = previewers.vim_buffer_qflist.new
    opts.defaults.buffer_previewer_maker = previewers.buffer_previewer_maker
    opts.defaults.file_sorter = sorters.get_fuzzy_file
    opts.defaults.generic_sorter = sorters.get_generic_fuzzy_sorter
    opts.defaults.mappings.n = { ["q"] = actions.close }
    telescope.setup(opts)

    for _, ext in ipairs(extensions_list) do
      telescope.load_extension(ext)
    end
  end,
}
