return {
  "anuvyklack/hydra.nvim",
  event = "VeryLazy",
  dependencies = {
    { "sindrets/winshift.nvim", cmd = "WinShift" },
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
^^^^^^^^   window       ^^^^^^^^^^^^^^^_=_: equalize^
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
      },
    }
  end,
}
