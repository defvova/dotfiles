return {
  'mvllow/modes.nvim',
  enabled = false,
  event = "VimEnter",
  version = 'v0.2.0',
  config = function()
    local function get_highlight(name, fallback)
      local id = vim.api.nvim_get_hl_id_by_name(name)
      if not id then
        return fallback
      end

      local background = vim.fn.synIDattr(id, 'bg')
      if not background or background == '' then
        return fallback
      end

      return background
    end


    require('modes').setup({
      colors = {
        copy = get_highlight("DiffDelete", '#f5c359'),
        delete = get_highlight("DiffText", '#c75c6a'),
        insert = get_highlight("CursorLine", '#431cc5'),
        visual = get_highlight("Cursor", '#9745be'),
      },
      ignore_filetypes = { 'neo-tree', 'TelescopePrompt' }
    })
  end
}
