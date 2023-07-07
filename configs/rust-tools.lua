-- rust

return {
  tools = {
    runnables = {
      use_telescope = true,
    },
    autosethints = true,
    inlay_hints = require("custom.utils").inlay_hints,
    hover_actions = { auto_focus = true }
  },

  server = {
    on_attach = require("custom.utils").on_attach,
    capabilities = require("plugins.configs.lspconfig").capabilities,
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

