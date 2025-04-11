-- lspconfig.lua

local lspconfig = require("lspconfig")

-- Python LSP (pyright)
lspconfig.pyright.setup({
  on_attach = function(client, bufnr)
    -- Add custom on_attach settings if necessary
  end,
})

-- C/C++ LSP (clangd)
lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    -- Add custom on_attach settings if necessary
  end,
})

-- Rust LSP (rust_analyzer)
lspconfig.rust_analyzer.setup({
  on_attach = function(client, bufnr)
    -- Add custom on_attach settings if necessary
  end,
})

