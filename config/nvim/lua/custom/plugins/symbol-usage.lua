-- return {
--   "Wansmer/symbol-usage.nvim",
--   event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
--   config = function()
--     local function text_format(symbol)
--       local res = {}
--
--       if symbol.references then
--         local usage = symbol.references <= 1 and "usage" or "usages"
--         local num = symbol.references == 0 and "no" or symbol.references
--         table.insert(res, { "󰌹 ", "SymbolUsageRef" })
--         table.insert(res, { ("%s %s"):format(num, usage) })
--       end
--
--       if symbol.definition then
--         if #res > 0 then
--           table.insert(res, { " ", "NonText" })
--         end
--         table.insert(res, { "󰳽 " })
--         table.insert(res, { symbol.definition .. " defs" })
--       end
--
--       if symbol.implementation then
--         if #res > 0 then
--           table.insert(res, { " ", "NonText" })
--         end
--         table.insert(res, { "󰡱 " })
--         table.insert(res, { symbol.implementation .. " impls" })
--       end
--
--       return res
--     end
--
--     require("symbol-usage").setup {
--       text_format = text_format,
--     }
--   end,
-- }

return {
  'VidocqH/lsp-lens.nvim',
  event = 'BufReadPre',
  config = function()
    require 'lsp-lens'.setup({
      ignore_filetype = {
        'Glance',
        'glance',
        'Empty'
      },
      sections = {
        definition = function(count)
          if count <= 1 then
            return ''
          end

          return "󰳽 " .. count .. " defs"
        end,
        references = function(count)
          if count == 0 then
            return ''
          end
          local usage = count <= 1 and "usage" or "usages"
          local num = count == 0 and "no" or count
          return "󰌹 " .. ("%s %s"):format(num, usage)
        end,
        implements = function(count)
          if count <= 1 then
            return ''
          end
          return "󰡱 " .. count .. " impls"
        end,
        git_authors = function(latest_author, count)
          return " " .. latest_author .. (count - 1 == 0 and "" or (" + " .. count - 1))
        end,
      }
    })
  end
}
