return {
  'akinsho/bufferline.nvim',
  event = 'UIEnter',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local cwd = "" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
    require("bufferline").setup({
      options = {
        themable = true,
        indicator = { style = 'underline' },
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        hover = { enabled = true, reveal = { 'close' } },
        offsets = {
          {
            text = cwd,
            filetype = 'neo-tree',
            highlight = 'PanelHeading',
            text_align = 'left',
            separator = true,
          },
          {
            text = ' DIFF VIEW',
            filetype = 'DiffviewFiles',
            highlight = 'PanelHeading',
            separator = true,
          },
        },
      }
    })

    local function map(mode, lhs, rhs, opts)
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    map('n', '[b', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Bufferline: prev' })
    map('n', ']b', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Bufferline: next' })
    map('n', '<leader>bd', '<Cmd>BufferLinePickClose<CR>', { desc = '[D]elete Buffer' })
  end
}
