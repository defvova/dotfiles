return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "benfowler/telescope-luasnip.nvim",
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
    pickers = {
      find_files = {
        results_title = false,
        previewer = false,
        layout_config = {
          width = 80,
        },
      },
      live_grep = {
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
      "noice",
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
