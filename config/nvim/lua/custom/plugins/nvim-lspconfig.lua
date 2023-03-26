return {
  -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { "j-hui/fidget.nvim", opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    "folke/neodev.nvim",

    "princejoogie/tailwind-highlight.nvim",
    {
      "jose-elias-alvarez/null-ls.nvim",
      dependencies = { "lukas-reineke/lsp-format.nvim", "jayp0521/mason-null-ls.nvim" },
    },
    { "b0o/schemastore.nvim" },
    {
      "jose-elias-alvarez/typescript.nvim",
    },
    {
      "simrat39/rust-tools.nvim",
      dependencies = {
        "mattn/webapi-vim",
        "felipec/vim-sanegx",
        "rust-lang/rust.vim",
      },
    },
  },
  config = function()
    local tw_highlight = require "tailwind-highlight"
    local schemastore = require "schemastore"
    require("lsp-format").setup {}

    local on_attach = function(client, bufnr)
      tw_highlight.setup(client, bufnr, {
        single_column = false,
        mode = "background",
        debounce = 200,
      })

      local nmap = function(keys, func, desc, opts)
        if desc then
          desc = "LSP: " .. desc
        end

        opts = vim.tbl_extend("keep", { noremap = true, silent = true, buffer = bufnr, desc = desc }, opts or {})
        vim.keymap.set("n", keys, func, opts)
      end

      local function show_documentation()
        local filetype = vim.bo.filetype
        if vim.tbl_contains({ "vim", "help" }, filetype) then
          vim.cmd("h " .. vim.fn.expand "<cword>")
        elseif vim.tbl_contains({ "man" }, filetype) then
          vim.cmd("Man " .. vim.fn.expand "<cword>")
        elseif vim.fn.expand "%:t" == "Cargo.toml" then
          require("crates").show_popup()
        else
          vim.lsp.buf.hover()
        end
      end

      nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

      nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
      nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
      nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
      nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
      nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

      nmap("K", show_documentation, "Hover Documentation")
      -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

      nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
      nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
      nmap("<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, "[W]orkspace [L]ist Folders")

      -- Diagnostic keymaps
      nmap("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
      nmap("]d", vim.diagnostic.goto_next, "Go to next diagnostic message")

      -- Create a command `:Format` local to the LSP buffer
      -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      --   vim.lsp.buf.format()
      -- end, { desc = 'Format current buffer with LSP' })

      require("lsp-format").on_attach(client)

      if client.server_capabilities.definitionProvider then
        vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
      end
    end

    local servers = {
      jsonls = {
        json = {
          schemas = schemastore.json.schemas(),
          validate = { enable = true },
        },
      },
      dockerls = {},
      yamlls = {},
      bashls = {},
      emmet_ls = {},
      cssls = {},
      html = {},
      tailwindcss = {},
      solargraph = {},
      rust_analyzer = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          checkOnSave = {
            command = "cargo clippy",
            extraArgs = { "--no-deps" },
          },
        },
      },
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = {
            globals = {
              "vim",
              "use",
              "describe",
              "it",
              "assert",
              "before_each",
              "after_each",
            },
          },
        },
      },
      tsserver = {
        disable_formatting = true,
        debug = false,
        server = {
          init_options = {
            preferences = {
              includeCompletionsWithSnippetText = true,
              includeCompletionsForImportStatements = true,
            },
          },
          settings = {
            completions = {
              completeFunctionCalls = true,
            },
            javascript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
          },
        },
      },
    }

    -- Setup neovim lua configuration
    require("neodev").setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities.textDocument.foldingRange = {
    --   dynamicRegistration = false,
    --   lineFoldingOnly = true,
    -- }
    local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if status_ok then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    -- Setup mason so it can manage external tooling
    require("mason").setup()

    -- Ensure the servers above are installed
    local mason_lspconfig = require "mason-lspconfig"

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    require("custom.plugins.lsp.handlers").setup()
    require("custom.plugins.lsp.null-ls").setup { on_attach = on_attach }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          root_dir = vim.loop.cwd,
        }
      end,
      ["rust_analyzer"] = function()
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
          server = servers["rust_analyzer"],
        }
      end,
      ["tsserver"] = function()
        require("typescript").setup {
          disable_commands = false,
          debug = false,
          server = servers["tsserver"],
        }
      end,
    }
  end,
}
