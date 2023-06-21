local util = require('custom.utils')
local plugins = require('lazy').plugins()

local clangd_found = false
for _, plugin in ipairs(plugins) do
  if plugin[1] == 'p00f/clangd_extensions.nvim' then
    clangd_found = true
    break
  end
end

-- if you just want default config for the servers then put them in a table
local servers = {
  {"bashls", "bash"},
  {"cmake", "cmake"},
  {"pylsp", "py"},
}
if not clangd_found then
  table.insert(servers, {"ccls", {"c", "cpp"}})
end

for _, lsps in ipairs(servers) do
  local lsp = lsps[1]
  util.lspconfig[lsp].setup {
    ft = lsps[2],
    on_attach = util.on_attach,
    capabilities = util.capabilities,
    codelens = true,
  }
end


