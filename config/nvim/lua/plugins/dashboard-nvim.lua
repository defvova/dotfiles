return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local db = require "dashboard"
    local function footer()
      local datetime = os.date "%d-%m-%Y %H:%M:%S"
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      local plugins_text = "⚡Neovim loaded "
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
          .. "     v"
          .. vim.version().major
          .. "."
          .. vim.version().minor
          .. "."
          .. vim.version().patch
          .. "     "
          .. datetime

      local fortune = require "core.fortune"
      local quote = fortune()

      table.insert(quote, 1, plugins_text)
      table.insert(quote, 1, "")
      return quote
    end

    local opts = {
      theme = "hyper",
      hide = {
        tabline = false,
      },
      config = {
        week_header = {
          enable = true,
          -- concat = "",
          append = { "", "GLORY TO UKRAINE" },
        },
        packages = { enable = false },
        shortcut = {
          { desc = " Update", group = "@property", action = "Lazy update", key = "u" },
          {
            desc = " Files",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
          {
            desc = " Projects",
            group = "DiagnosticHint",
            action = "Telescope project",
            key = "p",
          },
          {
            desc = " Last session",
            group = "DiagnosticHint",
            action = "lua require('persistence').load({ last = true })",
            key = "r",
          },
          {
            desc = " Dotfiles",
            group = "Number",
            action = "e $MYVIMRC | :cd %:p:h",
            key = "d",
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
