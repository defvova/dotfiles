local present, renamer = pcall(require, "renamer")

if not present then
  return
end

local mappings_utils = require "renamer.mappings.utils"
-- FIXME: set keymaps
local options = {
  -- mappings = {
  --   ["<c-i>"] = mappings_utils.set_cursor_to_start,
  --   ["<c-a>"] = mappings_utils.set_cursor_to_end,
  --   ["<c-e>"] = mappings_utils.set_cursor_to_word_end,
  --   ["<c-b>"] = mappings_utils.set_cursor_to_word_start,
  --   ["<c-c>"] = mappings_utils.clear_line,
  --   ["<c-u>"] = mappings_utils.undo,
  --   ["<c-r>"] = mappings_utils.redo,
  -- },
}

renamer.setup(options)
