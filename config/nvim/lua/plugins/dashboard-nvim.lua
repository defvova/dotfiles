return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local db = require "dashboard"
    local function footer()
      local datetime = os.date "%d-%m-%Y %H:%M:%S"
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      local plugins_text = " ⚡Neovim loaded "
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
          .. "   v"
          .. vim.version().major
          .. "."
          .. vim.version().minor
          .. "."
          .. vim.version().patch
          .. "   "
          .. datetime

      local fortune = require "core.fortune"
      local quote = fortune()

      table.insert(quote, 1, plugins_text)
      return quote
    end

    local opts = {
      theme = "doom",
      hide = {
        tabline = false,
      },
      config = {
        header = {
          "",
          "",
          "      Glory to Ukraine",
          "",
          "",
        },
        week_header = {
          enable = false,
        },
        center = {
          {
            icon = "  ",
            desc = "Find File",
            action = "Telescope find_files find_command=rg,--hidden,--files",
            key = "SPC f  ",
          },
          {
            icon = "  ",
            desc = "Recently opened files",
            action = "Telescope oldfiles",
            key = "SPC s o",
          },
          {
            icon = "  ",
            desc = "Find Word",
            action = "Telescope live_grep",
            key = "SPC s t",
          },
          {
            icon = "  ",
            desc = "Find Projects",
            action = "Telescope project",
            key = "SPC s p",
          },
          {
            icon = "  ",
            desc = "Restore last session",
            key = "SPC S l",
            action = "lua require('persistence').load({ last = true })",
          },
          {
            icon = "  ",
            desc = "Open Personal dotfiles",
            action = "e $MYVIMRC | :cd %:p:h",
            key = "SPC u s",
          },
        },
      },
    }

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        opts.config.footer = footer()
        db.setup(opts)
      end,
    })
  end,
}
