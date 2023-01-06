local present, cmp = pcall(require, "cmp")

if not present then
  return
end

-- vim.opt.completeopt = "menu,menuone,noselect"
vim.o.completeopt = "menu,menuone,noselect"

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match "^%s*$" == nil
end

local cmp_window = require "cmp.utils.window"

cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
  local info = self:info_()
  info.scrollable = false
  return info
end

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

local options = {
  -- window = {
  --   completion = {
  --     border = border "CmpBorder",
  --     winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
  --   },
  --   documentation = {
  --     border = border "CmpDocBorder",
  --   },
  -- },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = require("lspkind").cmp_format {
      -- with_text = true,
      mode = "symbol_text",
      maxwidth = 50,
      symbol_map = { Copilot = "" },
    },
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
        -- cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = {
    { name = "copilot", max_item_count = 3 },
    { name = "luasnip", max_item_count = 5 },
    { name = "nvim_lsp", max_item_count = 10 },
    { name = "buffer", keyword_length = 3, max_item_count = 5 },
    { name = "nvim_lua", max_item_count = 5 },
    { name = "path" },
    { name = "crates" },
  },
  sorting = {
    comparators = {
      require("copilot_cmp.comparators").prioritize,
      require("copilot_cmp.comparators").score,
    },
  },
}

cmp.setup(options)

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path", max_item_count = 5 },
  }, {
    { name = "cmdline", max_item_count = 15 },
  }),
})

-- lsp_document_symbols
cmp.setup.cmdline("/", {
  sources = cmp.config.sources({
    { name = "nvim_lsp_document_symbol", max_item_count = 8, keyword_length = 3 },
  }, {
    { name = "buffer", max_item_count = 5, keyword_length = 5 },
  }),
})

-- vim.api.nvim_exec(
--     [[
--         " autocmd! FileType sql setlocal omnifunc=vim_dadbod_completion#omni
--         autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
--     ]],
--     false
--   )
