local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  -- npm install -g eslint_d
  b.formatting.eslint_d,
  -- npm install -g @fsouza/prettierd
  b.formatting.prettierd.with {
    filetypes = { "html", "markdown", "css" },
  },

  -- Lua
  -- cargo install stylua
  b.formatting.stylua,

  -- Ruby
  -- gem install rubocop
  -- b.formatting.rubocop,
  -- b.diagnostics.rubocop,

  -- Rust
  -- rustup component add rustfmt
  b.formatting.rustfmt,

  -- -- Ansible
  b.diagnostics.ansiblelint,
  --
  -- -- Catch insensitive, inconsiderate writing
  b.diagnostics.alex,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = false,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
}
