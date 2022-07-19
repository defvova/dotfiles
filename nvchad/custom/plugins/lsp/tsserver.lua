local M = {}

M.setup = function(options)
  local present, typescript = pcall(require, "typescript")

  if not present then
    return
  end

  typescript.setup({
    debug = false,
    server = options,
  })
end

return M
--
--
-- local M = {}
--
-- M.setup = function(attach, capabilities)
--   local present, typescript = pcall(require, "typescript")
--
--   if not present then
--     return
--   end
--
--   typescript.setup {
--     debug = false,
--     server = {
--       on_attach = function(client, bufnr)
--         require("illuminate").on_attach(client)
--         attach(client, bufnr)
--         -- u.buf_map(bufnr, "n", "gs", ":TypescriptRemoveUnused<CR>")
--         -- u.buf_map(bufnr, "n", "gS", ":TypescriptOrganizeImports<CR>")
--         -- u.buf_map(bufnr, "n", "go", ":TypescriptAddMissingImports<CR>")
--         -- u.buf_map(bufnr, "n", "gA", ":TypescriptFixAll<CR>")
--         -- u.buf_map(bufnr, "n", "gI", ":TypescriptRenameFile<CR>")
--       end,
--       capabilities = capabilities,
--     },
--   }
-- end
--
-- return M
