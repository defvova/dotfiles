return {
  'vidocqh/auto-indent.nvim',
  lazy = false,
  opts = {
    indentexpr = function(lnum)
      return require("nvim-treesitter.indent").get_indent(lnum)
    end
  }
}
