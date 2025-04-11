local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)  -- Use LuaSnip to expand snippets
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),  -- Trigger completion
    ['<Tab>'] = cmp.mapping.select_next_item(),  -- Select next completion item
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),  -- Select previous completion item
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm selection
  }),
  sources = {
    { name = 'nvim_lsp' },  -- LSP completions
    { name = 'luasnip' },    -- Snippet completions
  },
})

