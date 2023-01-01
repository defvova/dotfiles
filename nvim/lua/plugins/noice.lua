local present, noice = pcall(require, "noice")

if not present then
  return
end

local options = {
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  notify = {
    enabled = false,
  },
}

noice.setup(options)
