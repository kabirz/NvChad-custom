-- clangd
return {
  server = {
    on_attach = require("custom.utils").on_attach,
    capabilities = require("plugins.configs.lspconfig").capabilities,
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
    inlay_hints = require("custom.utils").inlay_hints,
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

