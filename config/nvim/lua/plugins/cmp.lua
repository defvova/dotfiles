return {
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
    },
    config = function(_, opts)
      local luasnip = require "luasnip"
      luasnip.config.set_config(opts)
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "lukas-reineke/cmp-rg",
      { "hrsh7th/cmp-nvim-lua", ft = "lua" },
      "ray-x/cmp-treesitter",
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match "^%s*$" == nil
      end

      local options = {
        completion = {
          completeopt = "menu,menuone,noinsert,noselect",
        },
        preselect = cmp.PreselectMode.None,
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = require("lspkind").cmp_format {
            mode = "symbol_text",
            preset = "codicons",
            menu = {
              buffer = "[Buffer]",
              rg = "[RG]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              treesitter = "[TS]",
              path = "[Path]",
              crates = "[Crates]",
            },
          },
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete {},
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item { behavior = cmp.SelectBehavior, count = 1 }
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {
            "i",
            "s",
            "c",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item { behavior = cmp.SelectBehavior, count = 1 }
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
            "c",
          }),
        },
        sources = {
          { name = "path", priority_weight = 110 },
          { name = "treesitter", max_item_count = 10, priority_weight = 110 },
          { name = "nvim_lsp", max_item_count = 10, priority_weight = 100 },
          { name = "nvim_lua", max_item_count = 5, priority_weight = 90 },
          { name = "luasnip", max_item_count = 5, priority_weight = 80 },
          -- { name = "buffer", keyword_length = 3, max_item_count = 5, priority_weight = 70 },
          {
            name = "rg",
            keyword_length = 5,
            max_item_count = 5,
            priority_weight = 60,
            option = {
              additional_arguments = "--smart-case --hidden",
            },
          },
        },
      }

      cmp.setup(options)
      cmp.setup.filetype({ "rust", "rs", "toml" }, {
        sources = {
          { name = "crates", priority_weight = 110 },
        },
      })

      -- Use cmdline & path source for ':'.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path", max_item_count = 5 },
        }, {
          { name = "cmdline", max_item_count = 15 },
        }),
      })

      -- lsp_document_symbols
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "nvim_lsp_document_symbol", max_item_count = 8 },
        }, {
          { name = "buffer", max_item_count = 5 },
        }),
      })

      -- vim.api.nvim_exec(
      --     [[
      --         " autocmd! FileType sql setlocal omnifunc=vim_dadbod_completion#omni
      --         autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
      --     ]],
      --     false
      --   )
    end,
  },
}
