local present, gomove = pcall(require, "nvim-gomove")

if not present then
  return
end

-- FIXME: map default keys
local options = {
  -- whether or not to map default key bindings, (true/false)
  map_defaults = false,
  -- what method to use for reindenting, ("vim-move" / "simple" / ("none"/nil))
  reindent_mode = "vim-move",
  -- whether to not to move past line when moving blocks horizontally, (true/false)
  move_past_line = false,
  -- whether or not to ignore indent when duplicating lines horizontally, (true/false)
  ignore_indent_lh_dup = true,
}

gomove.setup(options)
