local M = {}

function M.setup()
  local dap = require "dap"
  local dapui = require "dapui"

  -- require("mason-nvim-dap").setup {
  --   -- Makes a best effort to setup the various debuggers with
  --   -- reasonable debug configurations
  --   automatic_setup = true,
  --
  --   -- You'll need to check that you have the required things installed
  --   -- online, please don't ask me how to install them :)
  --   ensure_installed = {
  --     -- Update this to ensure that you have the debuggers for the langs you want
  --     -- "delve",
  --   },
  -- }
  --
  -- -- You can provide additional configuration to the handlers,
  -- -- see mason-nvim-dap README for more information
  -- require("mason-nvim-dap").setup_handlers()

  -- Basic debugging keymaps, feel free to change to your liking!
  vim.keymap.set("n", "<F5>", dap.continue)
  vim.keymap.set("n", "<F1>", dap.step_into)
  vim.keymap.set("n", "<F2>", dap.step_over)
  vim.keymap.set("n", "<F3>", dap.step_out)
  vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
  vim.keymap.set("n", "<leader>B", function()
    dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
  end)

  -- Dap UI setup
  -- For more information, see |:help nvim-dap-ui|
  dapui.setup {
    force_buffers = false,
    element_mappings = {
      scopes = {
        edit = "l",
      },
    },
    layouts = {
      {
        elements = {
          "scopes",
          "breakpoints",
          "stacks",
          "watches",
          "something",
        },
        size = 80,
        position = "left",
      },
      {
        elements = { "repl", "console" },
        size = 0.25,
        position = "bottom",
      },
    },
    render = {
      max_value_lines = 3,
    },
    floating = { max_width = 0.9, max_height = 0.5, border = vim.g.border_chars },
    -- Set icons to characters that are more likely to work in every terminal.
    --    Feel free to remove or use ones that you like more! :)
    --    Don't feel like these are good choices.
    icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
    controls = {
      icons = {
        pause = "⏸",
        play = "▶",
        step_into = "⏎",
        step_over = "⏭",
        step_out = "⏮",
        step_back = "b",
        run_last = "▶▶",
        terminate = "⏹",
      },
    },
  }
  pcall(require("dap.ext.vscode").load_launchjs)

  dap.listeners.after.event_initialized["dapui_config"] = dapui.open
  dap.listeners.before.event_terminated["dapui_config"] = dapui.close
  dap.listeners.before.event_exited["dapui_config"] = dapui.close

  vim.schedule(function()
    local mason_registry = require "mason-registry"

    dap.adapters.node2 = {
      type = "executable",
      command = "node",
      args = {
        mason_registry.get_package("node-debug2-adapter"):get_install_path() .. "/out/src/nodeDebug.js",
      },
    }
  end)

  dap.adapters.nlua = function(callback, config)
    callback { type = "server", host = config.host, port = config.port }
  end

  dap.configurations.javascript = {
    {
      name = "Launch",
      type = "node2",
      request = "launch",
      program = "${file}",
      args = { "--stdio" },
      cwd = vim.fn.getcwd(),
      env = { ELECTRON_RUN_AS_NODE = "true" },
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
    },
    {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = "Attach to process",
      type = "node2",
      request = "attach",
      processId = require("dap.utils").pick_process,
    },
  }

  require("dap-ruby").setup()
end

return M
