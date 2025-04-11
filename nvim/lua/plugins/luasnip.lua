local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- load friendly snippets from vscode-style snippets (optional)
--require("luasnip.loaders.from_vscode").lazy_load()
-- check if the friendly-snippets are loaded
print(vim.inspect(require("luasnip").snippets))

-- custom luasnip snippets (you can define your own snippets here)
ls.snippets = {
  c = {
    s("struct", {
      t("struct "), i(1, "mystruct"), t(" {"),
      t({ "", "\t" }), i(2, "member1"),
      t({ "", "\t" }), i(3, "member2"),
      t({ "", "}" }),
    }),
  },
}

-- keybindings for navigating luasnip placeholders with arrows
-- use lua functions to handle the navigation

-- correctly map the arrow keys in insert and snippet mode
vim.api.nvim_set_keymap('s', '<down>', [[<cmd>lua require'luasnip'.jump(1)<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('s', '<up>', [[<cmd>lua require'luasnip'.jump(-1)<cr>]], { noremap = true, silent = true })

-- optionally: customize snippet expansion
ls.config.set_config({
  history = true,  -- keep the history of snippets
  updateevents = "textchanged,textchangedi",  -- auto-update snippets
})

