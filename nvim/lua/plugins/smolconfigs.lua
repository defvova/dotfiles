local M = {}

M.todo = function()
  local present, todo = pcall(require, "todo-comments")

  if present then
    todo.setup()
  end
end

M.surround = function()
  local present, surround = pcall(require, "surround")

  if present then
    surround.setup { mappings_style = "sandwich" }
  end
end

M.persistence = function()
  local present, persistence = pcall(require, "persistence")

  if present then
    persistence.setup {
      dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
      options = { "buffers", "curdir", "tabpages", "winsize" },
    }
  end
end

M.autotag = function()
  local present, autotag = pcall(require, "nvim-ts-autotag")

  if present then
    autotag.setup()
  end
end

M.matchup = function()
  local present, _ = pcall(require, "vim-matchup")

  if present then
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end
end

return M
