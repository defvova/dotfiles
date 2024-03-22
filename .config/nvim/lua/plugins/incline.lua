return {
  'b0o/incline.nvim',
  event = 'VeryLazy',
  config = function()
    local devicons = require 'nvim-web-devicons'
    require('incline').setup {
      window = {
        zindex = 500,
        padding = 0,
        padding_char = " ",
        margin = {
          horizontal = 1,
          vertical = 0,
        },
        -- overlap = {
        --   winbar = true,
        --   tabline = false,
        -- },
      },
      highlight = {
        groups = {
          InclineNormal = {
            default = true,
            group = "TabLine",
          },
          InclineNormalNC = {
            default = true,
            group = "TabLine",
          },
        },
      },
      debounce_threshold = {
        rising = 10,
        falling = 10,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        if filename == '' then
          filename = '[No Name]'
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified

        local function get_diagnostic_label()
          local icons = {
            error = " ",
            warn = " ",
            info = " ",
            hint = " "
          }
          local label = {}

          for severity, icon in pairs(icons) do
            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
            if n > 0 then
              table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
            end
          end
          if #label > 0 then
            table.insert(label, { '' })
          end
          return label
        end

        return {
          { ' ',      get_diagnostic_label() },
          ft_icon and { ft_icon, ' ', guifg = ft_color } or '',
          ' ',
          { filename, gui = modified and 'bold,italic' or 'bold' },
          modified and { ' ', '', ' ' } or ' '
        }
      end,
    }
  end
}
