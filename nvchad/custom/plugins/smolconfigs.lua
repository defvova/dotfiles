local M = {}

M.lightbulb = function()
  local present, lightbulb = pcall(require, "kosayoda/nvim-lightbulb")

  if present then
    lightbulb.setup { autocmd = { enabled = true } }
  end
end

M.surround = function()
  local present, surround = pcall(require, "surround")

  if present then
    surround.setup { mappings_style = "sandwich" }
  end
end

M.illuminate = function()
  local present, _ = pcall(require, "vim-illuminate")

  if present then
    vim.g.Illuminate_ftblacklist = { "NvimTree" }
    vim.g.Illuminate_delay = 100
  end
end

M.project = function()
  local present, project = pcall(require, "telescope-project")

  if present then
    vim.cmd [[packadd telescope.nvim]]

    require("telescope").load_extension "file_browser"
    require("telescope").load_extension "project"
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

M.endwise = function()
  local present, _ = pcall(require, "nvim-treesitter-endwise")

  if present then
    require("nvim-treesitter.configs").setup {
      endwise = {
        enable = true,
      },
    }
  end
end

M.matchup = function()
  local present, _ = pcall(require, "vim-matchup")

  if present then
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
    require("nvim-treesitter.configs").setup {
      matchup = {
        enable = true, -- mandatory, false will disable the whole extension
      },
    }
  end
end

M.rainbow = function()
  local present, _ = pcall(require, "nvim-ts-rainbow")

  if present then
    require("nvim-treesitter.configs").setup { rainbow = { enable = true, extended_mode = true } }
  end
end

return M
