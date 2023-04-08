return {
  -- Autocompletion
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "onsails/lspkind-nvim",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
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
  },
  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"

    -- luasnip.config.setup {}
    -- local has_words_before = function()
    --   if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    --     return false
    --   end
    --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --   return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match "^%s*$" == nil
    -- end

    local cmp_options = {
      completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      },
      preselect = cmp.PreselectMode.None,
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
          maxwidth = 50,
          ellipsis_char = "...",
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
        duplicates = {
          buffer = 1,
          rg = 1,
          nvim_lsp = 1,
          luasnip = 1,
          treesitter = 1,
          path = 1,
        },
      },
      mapping = cmp.mapping.preset.insert {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete {},
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ["<C-p>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- if cmp.visible() and has_words_before() then
            cmp.select_next_item { behavior = cmp.SelectBehavior, count = 1 }
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-n>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item { behavior = cmp.SelectBehavior, count = 1 }
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- if cmp.visible() and has_words_before() then
            cmp.select_next_item { behavior = cmp.SelectBehavior, count = 1 }
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item { behavior = cmp.SelectBehavior, count = 1 }
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      sources = {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      },
    }

    if vim.o.ft == "lua" then
      table.insert(cmp_options.sources, { name = "nvim_lua", max_item_count = 10, priority_weight = 100 })
    end

    if vim.o.ft == "toml" or vim.o.ft == "rust" then
      table.insert(cmp_options.sources, { name = "crates", priority_weight = 110 })
    end

    cmp.setup(cmp_options)

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
  end,
}
