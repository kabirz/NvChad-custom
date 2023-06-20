local on_attach = require("custom.utils").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    autosethints = true,
    inlay_hints = {
      auto = true,
      show_parameter_hints = true,
      parameter_hints_prefix = '',
      other_hints_prefix = ": ",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "LazyReasonFt",
    },
    hover_actions = { auto_focus = true }
  },

  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    codelens = true,
    settings = {
      rust_analyzer = {
        codelens = {
          enable = true,
        },
        diagnostics = {
          enable = true,
        },

      }
    }
  }
}


return options
