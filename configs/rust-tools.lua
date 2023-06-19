local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    autosethints = true,
    inlay_hints = { show_parameter_hints = true },
    hover_actions = { auto_focus = true }
  },

  server = {
    on_attach = function (_, buffer)
      require("rust-tools").inlay_hints.set()
      require("rust-tools").inlay_hints.enable()
      require('rust-tools').runnables.runnables()
      on_attach(_, buffer)
    end,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        lens = {
          enable = true,
        }
      }
    }
  }
}


return options
