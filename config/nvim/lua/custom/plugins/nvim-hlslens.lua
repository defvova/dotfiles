return {
  'kevinhwang91/nvim-hlslens',
  keys = {
    {
      "n",
      [[<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>]],
      desc = "Invoke next search"
    },
    {
      "N",
      [[<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require('hlslens').start()<cr>]],
      desc = "Invoke prev search"
    },
    {
      "*",
      [[#<Cmd>lua require('hlslens').start()<CR>]],
      desc = "Invoke start prev search"
    },
    {
      "#",
      [[*<Cmd>lua require('hlslens').start()<CR>]],
      desc = "Invoke start next search"
    },
    {
      "g*",
      [[g#<Cmd>lua require('hlslens').start()<CR>]],
      desc = "Invoke start next search"
    },
    {
      "g#",
      [[g*<Cmd>lua require('hlslens').start()<CR>]],
      desc = "Invoke start next search"
    },
  },
  config = function ()
    require("scrollbar.handlers.search").setup()
  end
}
