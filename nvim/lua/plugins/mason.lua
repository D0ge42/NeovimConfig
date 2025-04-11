-- mason.lua

-- Setup Mason for LSP, linters, and formatters
require("mason").setup()

-- Setup Mason-LSPconfig
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "pyright" },  -- Only install the relevant LSPs (C/C++ and Python)
  automatic_installation = true,                -- Automatically install missing LSPs
})

-- Set up LSP configurations
local lspconfig = require("lspconfig")

-- C/C++ LSP (clangd)
lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    -- Custom LSP keybindings or settings can be added here
  end,
})

-- Python LSP (pyright)
lspconfig.pyright.setup({
  on_attach = function(client, bufnr)
    -- Custom LSP keybindings or settings can be added here
  end,
})

