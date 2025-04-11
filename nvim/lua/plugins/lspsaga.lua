local saga = require("lspsaga")

saga.setup({
  error_sign = '✗',
  warn_sign = '⚠',
  hint_sign = '',
  infor_sign = '',
  border_style = "rounded",  -- Border style for LSP UI
  code_action_icon = '💡',
  lightbulb = {
	  enable = false,
  },
  symbol_in_winbar = {
	  enable = false
  },
  code_action_keys = {
    quit = 'q',
    exec = '<CR>',
  },
  rename_action_keys = {
    quit = 'q',
    exec = '<CR>',
  },
  definition_action_keys = {
    edit = '<CR>',
    vsplit = '<C-v>',
    split = '<C-x>',
  },
  rename_prompt_prefix = "Rename: ",
})

-- Keybindings for LSP features with lspsaga
vim.keymap.set("n", "<leader>n", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous diagnostic" })
vim.keymap.set("n", "<leader>p", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next diagnostic" })

-- Keybindings for code actions
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename Symbol" })
vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to Definition" })
vim.keymap.set("n", "<leader>\\", "<cmd>Lspsaga term_toggle<CR>", { desc = "Toggle floating terminal" })
vim.keymap.set("t", "<leader>\\", "<cmd>Lspsaga term_toggle<CR>", { desc = "Toggle floating terminal" })

