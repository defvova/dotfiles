local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- npm install -g eslint_d
  -- b.diagnostics.eslint_d,
  -- b.code_actions.eslint_d,
  b.formatting.eslint_d,
  -- npm install -g @fsouza/prettierd
  b.formatting.prettier,
  -- cargo install stylua
  b.formatting.stylua,
  -- b.formatting.rubocop,
  b.formatting.rufo,
  -- rustup component add rustfmt
  b.formatting.rustfmt,
  b.formatting.jq,

  -- brew install hadolint
  b.diagnostics.hadolint,

  -- b.code_actions.gitsigns,
  b.code_actions.gitrebase,
  -- b.code_actions.refactoring,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = false,
  sources = sources,
  log_level = "off",
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
