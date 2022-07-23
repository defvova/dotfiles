local M = {}

M.todo = function()
  local present, todo = pcall(require, "todo-comments")

  if present then
    todo.setup()
  end
end

M.trouble = function()
  local present, trouble = pcall(require, "trouble")

  if present then
    trouble.setup {
      auto_open = false,
      use_diagnostic_signs = true, -- en
    }
  end
end

-- M.lightbulb = function()
--   local present, lightbulb = pcall(require, "nvim-lightbulb")
--
--   if present then
--     lightbulb.setup { autocmd = { enabled = true } }
--   end
-- end

M.surround = function()
  local present, surround = pcall(require, "surround")

  if present then
    surround.setup { mappings_style = "sandwich" }
  end
end

M.illuminate = function()
  local present, _ = pcall(require, "vim-illuminate")

  if present then
    vim.g.Illuminate_ftblacklist = { "NvimTree", "Neogit" }
    vim.g.Illuminate_delay = 100
  end
end

M.dressing = function()
  local present, dressing = pcall(require, "dressing")

  if present then
    dressing.setup {
      input = {
        winblend = 0,
      },
    }
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
