return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  init = function()
    require("legendary").commands({
      {
        ":MarkdownPreviewToggle",
        description = "[Markdown]: Toggle preview",
      },
      {
        ":MarkdownPreview",
        description = "[Markdown]: Open preview",
      },
      {
        ":MarkdownPreviewStop",
        description = "[Markdown]: Close preview",
      }
    })
  end,
  build = function() vim.fn["mkdp#util#install"]() end,
}
