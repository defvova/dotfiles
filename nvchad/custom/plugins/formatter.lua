local present, formatter = pcall(require, "formatter")

if not present then
  return
end

local options = {
  logging = true,
  filetype = {
    lua = {
      -- cargo install stylua
      require("formatter.filetypes.lua").stylua,
    },
    ruby = {
      require("formatter.filetypes.ruby").rubocop,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettier,
    },
    rust = {
      -- rustup component add rustfmt
      require("formatter.filetypes.rust").rustfmt,
    },
    json = {
      -- FIXME: doesn't work
      require("formatter.filetypes.json").jq,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettier,
    },
  },
}

formatter.setup(options)
