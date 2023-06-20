local M = {}
local group = vim.api.nvim_create_augroup("LSP", { clear = true })
local utils = require "core.utils"

local is_alive = function(client)
  if client == nil then
    return false
  end
  if not client.initialized then
    return false
  end
  if client.is_stopped() then
    return false
  end
  return true
end

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
  end

  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
    if client.server_capabilities.codeLensProvider then
    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
      buffer = bufnr,
      callback = function()
        if is_alive(client) then
          vim.lsp.codelens.refresh()
        end
      end,
      group = group,
    })

    vim.api.nvim_create_autocmd("LspDetach", {
      buffer = bufnr,
      callback = function()
        if is_alive(client) then
          vim.lsp.codelens.clear()
        end
      end,
      group = group,
    })
  end
end

return M
