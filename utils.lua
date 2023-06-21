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

M.capabilities = require("plugins.configs.lspconfig").capabilities
M.lspconfig = require "lspconfig"

local inlay_hints = {
  auto = true,
  show_parameter_hints = true,
  parameter_hints_prefix = '',
  other_hints_prefix = ": ",
  max_len_align = false,
  max_len_align_padding = 1,
  right_align = false,
  right_align_padding = 7,
  highlight = "LazyReasonFt",
}
-- rust
M.rust_opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    autosethints = true,
    inlay_hints = inlay_hints,
    hover_actions = { auto_focus = true }
  },

  server = {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    codelens = true,
    settings = {
      rust_analyzer = {
        lens = {
          enable = true,
        },
        diagnostics = {
          enable = true,
        },

      }
    }
  }
}

-- clangd
M.clangd_opts = {
  server = {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    codelens = true,
    settings = {
      cland = {
        lens = {
          enable = true,
        },
        diagnostics = {
          enable = true,
        },

      }
    }
  },
  extensions = {
    autoSetHints = true,
    inlay_hints = inlay_hints,
    ast = {
      role_icons = {
        type = "🄣",
        declaration = "🄓",
        expression = "🄔",
        statement = ";",
        specifier = "🄢",
        ["template argument"] = "🆃",
      },
      kind_icons = {
        Compound = "🄲",
        Recovery = "🅁",
        TranslationUnit = "🅄",
        PackExpansion = "🄿",
        TemplateTypeParm = "🅃",
        TemplateTemplateParm = "🅃",
        TemplateParamObject = "🅃",
      },
      highlights = {
        detail = "Comment",
      },
    },
    memory_usage = {
      border = "none",
    },
    symbol_info = {
      border = "none",
    },
  },
}

return M
