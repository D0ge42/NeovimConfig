-- Set leader key to space
vim.g.mapleader = " "

-- Enable absolute line numbers
vim.wo.number = true
vim.g.buftabline_show = 1     -- Show the buffer tabline
vim.g.buftabline_show_numbers = 1  -- Show buffer numbers in the tabline
vim.g.buftabline_use_icons = 1  -- Use buffer icons

vim.cmd("colorscheme retrobox")

-- Lazy.nvim Plugin Manager Setup
require("lazy").setup({
  -- Mason (LSP, Linters, Debuggers)
  { "williamboman/mason.nvim", lazy = false, priority = 100 },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },

  -- Completion Plugins
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },
  { "windwp/nvim-autopairs" },

  -- UI & Productivity
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvimdev/lspsaga.nvim" },
  { "alec-gibson/nvim-tetris", lazy = false },  -- Tetris Plugin
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },

  { "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  -- Colorscheme
  { "morhetz/gruvbox" },
  { 'ap/vim-buftabline' },

  -- Fugitive plugin for Git integration
  { "tpope/vim-fugitive" },
   { "numToStr/Comment.nvim", config = function()
    require("Comment").setup({
      padding = true,  -- Adds a space after the comment delimiter (e.g., // )
      sticky = true,   -- Keeps cursor position even after comment
      ignore = nil,    -- Allow comment on lines starting with spaces
    })
  end },
})

-- Mason Setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "clangd", "rust_analyzer" },
  automatic_installation = true,
})

-- LSP Configuration
local lspconfig = require("lspconfig")
lspconfig.pyright.setup{}
lspconfig.clangd.setup{}
lspconfig.rust_analyzer.setup{}

-- Snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- UI Plugins
require("nvim-tree").setup()
require("plugins.lspsaga")

-- Setup nvim-autopairs
require('nvim-autopairs').setup()

-- Keybindings
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", { desc = "Search files" })
vim.keymap.set("n", "<leader>s", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>n", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous diagnostic" })
vim.keymap.set("n", "<leader>p", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next diagnostic" })
vim.keymap.set("n", "<A-e>", "<C-w>h", { desc = "Navigate to the window on the left" })
vim.keymap.set("n", "<A-r>", "<C-w>l", { desc = "Navigate to the window on the right" })
vim.keymap.set("n", "<leader>q", ":close<CR>", { desc = "Close buffer" })
vim.keymap.set('n', '<leader>gf', ':Gdiff<CR>', { desc = 'Git Diff' })
vim.keymap.set("n", "<leader>k", ":bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>j", ":bprev<CR>", { desc = "Go to previous buffer" })
-- Resize split windows with Ctrl + arrow keys
vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })
-- Comment with Alt + \
vim.keymap.set("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = "Toggle comment on current line" })
vim.keymap.set("v", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment on selected lines" })
vim.keymap.set("n", "<leader>l", ":bdelete<CR>", { noremap = true})

-- You can add similar mappings for other buffers as needed

-- Completion Plugin (nvim-cmp)
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

