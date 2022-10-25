local M = {}

function M.setup(servers, options)
  local lspconfig = require "lspconfig"

  require("mason").setup {
    ui = {
      icons = {
        package_pending = " ",
        package_installed = " ",
        package_uninstalled = " ﮊ",
      },
    },
    max_concurrent_installers = 10,
  }

  require("mason-tool-installer").setup {
    ensure_installed = {
      "bash-language-server",
      "codelldb",
      "css-lsp",
      "dockerfile-language-server",
      "emmet-ls",
      "eslint-lsp",
      "html-lsp",
      "json-lsp",
      "lua-language-server",
      "rust-analyzer",
      "solargraph",
      "stylua",
      "typescript-language-server",
    },
    auto_update = false,
    run_on_start = true,
  }

  require("mason-lspconfig").setup {
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = false,
  }

  -- Package installation folder
  local install_root_dir = vim.fn.stdpath "data" .. "/mason"

  require("mason-lspconfig").setup_handlers {
    function(server_name)
      local opts = vim.tbl_deep_extend("force", options, servers[server_name] or {})
      lspconfig[server_name].setup { opts }
    end,
    ["sumneko_lua"] = function()
      local opts = vim.tbl_deep_extend("force", options, servers["sumneko_lua"] or {})
      require("neodev").setup {}
      lspconfig.sumneko_lua.setup { opts }
    end,
    ["rust_analyzer"] = function()
      local opts = vim.tbl_deep_extend("force", options, servers["rust_analyzer"] or {})

      -- DAP settings - https://github.com/simrat39/rust-tools.nvim#a-better-debugging-experience
      local extension_path = install_root_dir .. "/packages/codelldb/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/bin/lldb"

      require("rust-tools").setup {
        tools = {
          autoSetHints = true,
          runnables = { use_telescope = true },
          inlay_hints = { show_parameter_hints = true },
          -- executor = require("rust-tools/executors").toggleterm,
          hover_actions = { auto_focus = true },
          on_initialized = function()
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
              pattern = { "*.rs" },
              callback = function()
                vim.lsp.codelens.refresh()
              end,
            })
          end,
        },
        server = opts,
        -- dap = {
        --   adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        -- },
        -- dap = {
        --   adapter = {
        --     type = "executable",
        --     command = "lldb-vscode",
        --     name = "rt_lldb",
        --   },
        -- },
      }
      -- require("plugins.dap.rust").setup()
    end,
    ["tsserver"] = function()
      local opts = vim.tbl_deep_extend("force", options, servers["tsserver"] or {})
      require("typescript").setup {
        disable_commands = false,
        debug = false,
        server = opts,
      }
    end,
  }
end

return M
