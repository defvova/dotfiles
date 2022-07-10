local present, regex = pcall(require, "nvim-regexplainer")

if not present then
  return
end

local options = {
  -- 'narrative'
  mode = "narrative", -- TODO: 'ascii', 'graphical'

  -- automatically show the explainer when the cursor enters a regexp
  auto = false,

  -- filetypes (i.e. extensions) in which to run the autocommand
  filetypes = {
    "html",
    "js",
    "cjs",
    "mjs",
    "ts",
    "jsx",
    "tsx",
    "cjsx",
    "mjsx",
    "go",
    "lua",
    "vim",
  },

  -- mappings = {
  --   toggle = "<Leader>gR",
  --   -- examples, not defaults:
  --   -- show = 'gS',
  --   -- hide = 'gH',
  --   -- show_split = 'gP',
  --   -- show_popup = 'gU',
  -- },

  narrative = {
    separator = "\n",
  },
}

regex.setup(options)
