local present, fold = pcall(require, "pretty-fold")

if not present then
  return
end

local options = {}
fold.setup(options)

local preview = require "pretty-fold.preview"

local ruby_fold_config = {
  -- process_comment_signs = false,
  matchup_patterns = {
    { "^%s*do$", "end" },
    { "^%s*if", "end" },
    { "def", "end" },
    { "class", "end" },
    { "{", "}" },
    { "(", ")" },
    { "[", "]" },
  },
}
fold.ft_setup("ruby", ruby_fold_config)

preview.setup()
