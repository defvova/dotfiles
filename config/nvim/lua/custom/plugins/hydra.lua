return {
  "anuvyklack/hydra.nvim",
  event = "VeryLazy",
  dependencies = {
    "mrjones2014/smart-splits.nvim",
    { "sindrets/winshift.nvim", cmd = "WinShift" },
    {
      "anuvyklack/windows.nvim",
      cmd = { "WindowsMaximaze", "WindowsMaximizeVertically", "WindowsMaximizeHorizontally", "WindowsEqualize" },
      -- keys = {
      --   { "<C-w>z", "WindowsMaximaze", { desc = "Maximize current window." } },
      -- },
      dependencies = {
        "anuvyklack/middleclass",
        "anuvyklack/animation.nvim",
      },
      config = function()
        vim.o.winwidth = 10
        vim.o.winminwidth = 10
        vim.o.equalalways = false
        require("windows").setup {
          autowidth = {
            enable = false,
          },
        }
      end,
    },
  },
  config = function()
    local cmd = require("hydra.keymap-util").cmd
    local Hydra = require "hydra"

    local window_hint = [[
^^^^^^^^     Move       ^^^^^^^^^^^^^^^^    Size   ^^^    ^^^^^^     Split
^^^^^^^^--------------  ^^^^^^^^^^^^^^^^-----------^^^    ^^^^^^---------------
^ ^ ^ ^ ^ ^ _K_^ ^ ^ ^^^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ _k_   ^ ^^ ^ ^ ^ ^ _s_: horizontally
^ ^ ^ _H_^ ^ ^ ^ ^ _L_^^ ^ ^ ^ ^ ^ ^ ^ _h_ ^ ^ ^ ^ _l_^ ^ ^   ^ _v_: vertically
^ ^ ^ ^ ^ ^ _J_^ ^ ^ ^^^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ _j_   ^ ^^ ^ ^ ^ ^ _q_: close
^^^^^^^^   window       ^^^^^^^^^^^^^^^_=_: equalize ^^ ^ ^^ ^^^_z_: maximize
^ ^ ^ ^ ^ ^  ^ ^ ^ ^ ^ ^   ^^ ^  ^^^^^^^^^^^^^^^^^          ^   _o_: remain only
]]

    Hydra {
      name = "Window management",
      hint = window_hint,
      config = {
        color = "pink",
        invoke_on_body = true,
        hint = {
          border = "solid",
          offset = -1,
        },
      },
      mode = "n",
      body = "<C-w>",
      heads = {
        { "H", cmd "WinShift left" },
        { "J", cmd "WinShift down" },
        { "K", cmd "WinShift up" },
        { "L", cmd "WinShift right" },
        -- Split
        { "s", "<C-w>s", { desc = "split horizontally" } },
        { "v", "<C-w>v", { desc = "split vertically" } },
        { "q", "<C-w>c", { desc = "close window" } },
        -- Size
        { "=", "<C-w>=", { desc = "equalize" } },
        {
          "h",
          cmd [[lua require("smart-splits").resize_left()]],
          { desc = "increase width" },
        },
        {
          "l",
          cmd [[lua require("smart-splits").resize_right()]],
          { desc = "decrease width" },
        },
        {
          "k",
          cmd [[lua require("smart-splits").resize_up()]],
          { desc = "decrease height" },
        },
        {
          "j",
          cmd [[lua require("smart-splits").resize_down()]],
          { desc = "increase height" },
        },
        { "<Esc>", nil, { exit = true } },
        { "z", cmd [[lua require("windows.commands").maximize()]], { exit = true, desc = "maximize" } },
        { "<C-z>", cmd [[lua require("windows.commands").maximize()]], { exit = true, desc = false } },
        { "o", "<C-w>o", { exit = true, desc = "remain only" } },
        { "<C-o>", "<C-w>o", { exit = true, desc = false } },

        { "<Esc>", nil, { exit = true, desc = false } },
      },
    }

    local function run(method, args)
      return function()
        local dap = require "dap"
        if dap[method] then
          dap[method](args)
        end
      end
    end

    local hint = [[
 _n_: step over   _s_: Continue/Start   _b_: Breakpoint     _K_: Eval
 _i_: step into   _x_: Quit             ^ ^                 ^ ^
 _o_: step out    _X_: Stop             ^ ^
 _c_: to cursor   _C_: Close UI
 ^
 ^ ^              _q_: exit
]]

    Hydra {
      hint = hint,
      config = {
        color = "pink",
        invoke_on_body = true,
        hint = hint_opts,
      },
      name = "dap",
      mode = { "n", "x" },
      body = "<leader>dh",
      heads = {
        { "n", run "step_over", { silent = true } },
        { "i", run "step_into", { silent = true } },
        { "o", run "step_out", { silent = true } },
        { "c", run "run_to_cursor", { silent = true } },
        { "s", run "continue", { silent = true } },
        { "x", run("disconnect", { terminateDebuggee = false }), { exit = true, silent = true } },
        { "X", run "close", { silent = true } },
        {
          "C",
          ":lua require('dapui').close()<cr>:DapVirtualTextForceRefresh<CR>",
          { silent = true },
        },
        { "b", run "toggle_breakpoint", { silent = true } },
        { "K", ":lua require('dap.ui.widgets').hover()<CR>", { silent = true } },
        { "q", nil, { exit = true, nowait = true } },
      },
    }
  end,
}
