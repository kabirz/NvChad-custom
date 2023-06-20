
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local on_attach = require("custom.utils").on_attach

-- if you just want default config for the servers then put them in a table
local servers = { "bashls", "ccls", "cmake", "pylsp" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    codelens = true,
  }
end


-- 
-- lspconfig.pyright.setup { blabla}
