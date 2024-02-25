return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text", opts = {} },
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    vim.g.dap_virtual_text = true
    -- request variable values for all frames (experimental)
    vim.g.dap_virtual_text = 'all frames'

    dapui.setup {
      force_buffers = false,
      element_mappings = {
        scopes = {
          expand = { "l", "h" },
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

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    local icons_dap = {
      Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
      Breakpoint          = " ",
      BreakpointCondition = " ",
      BreakpointRejected  = { " ", "DiagnosticError" },
      LogPoint            = ".>",
    }

    for name, sign in pairs(icons_dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end
  end
}
