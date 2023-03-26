local M = {}

local nls = require "null-ls"
local nls_utils = require "null-ls.utils"
local b = nls.builtins

local with_diagnostics_code = function(builtin)
  return builtin.with {
    diagnostics_format = "#{m} [#{c}]",
  }
end

local with_root_file = function(builtin, files)
  return builtin.with {
    condition = function(utils)
      return utils.root_has_file(files)
    end,
  }
end

local sources = {
  -- formatting
  b.formatting.standardjs,
  -- with_root_file(b.formatting.prettierd, { ".prettierrc.json", "prettierrc.js" }),
  -- b.formatting.rome,
  -- b.formatting.shfmt,
  b.formatting.fixjson,
  b.formatting.rustfmt,
  -- b.formatting.black.with { extra_args = { "--fast" } },
  -- b.formatting.isort,
  with_root_file(b.formatting.stylua, { "stylua.toml", ".stylua.toml" }),
  with_root_file(b.formatting.rubocop, { ".rubocop.yml" }),

  -- diagnostics
  -- b.diagnostics.write_good,
  -- b.diagnostics.markdownlint,
  -- b.diagnostics.eslint_d,
  -- b.diagnostics.flake8,
  -- b.diagnostics.tsc,
  -- with_root_file(b.diagnostics.selene, { "selene.toml" }),
  -- with_diagnostics_code(b.diagnostics.shellcheck),

  -- code actions
  b.code_actions.gitsigns,
  b.code_actions.gitrebase,

  -- hover
  b.hover.dictionary,
}

function M.setup(opts)
  nls.setup {
    -- debug = true,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    on_attach = opts.on_attach,
    root_dir = nls_utils.root_pattern ".git",
  }
  require("mason-null-ls").setup_handlers()
end

return M
