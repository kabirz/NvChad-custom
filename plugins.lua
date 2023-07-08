---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    'Exafunction/codeium.vim',
    lazy = false,
    config = function()
      require("core.utils").load_mappings "codeium"
    end
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = "neovim/nvim-lspconfig",
    ft = "rust",
    init = function()
      require("core.utils").load_mappings "rust_tools"
    end,
    config = function()
      require("rust-tools").setup(require('custom.configs.rust-tools'))
    end
  },
  {
    'p00f/clangd_extensions.nvim',
    dependencies = "neovim/nvim-lspconfig",
    ft = {"c", "cpp"},
    config = function()
      require("clangd_extensions").setup(require('custom.configs.clangd-tools'))
    end,
  },
  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "oberblastmeister/zoom.nvim",
    event = 'BufEnter',
    config = function()
      require("core.utils").load_mappings "zoom"
    end,
  },
  {
    "rqdmap/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    event = 'BufEnter',
    opts = require('custom.configs.symbols_outline'),
    config = function(_, opts)
      require("symbols-outline").setup(opts)
      require("core.utils").load_mappings "outline"
    end
  },
  {
    "machakann/vim-highlightedyank",
    event = "BufRead",
    config = function()
      vim.g.highlightedyank_highlight_duration = 500
    end
  },
  {
    "CRAG666/code_runner.nvim",
    event = 'BufEnter',
    cmd = { "RunCode", "RunFile", "RunProject", "RunClose", "CRFiletype", "CRProjects" },
    config = function ()
      require("core.utils").load_mappings "code_runner"
      require("code_runner").setup({
        mode = "float",
        startinsert = true,
        term = { tab = true, size = 15, },
      })
    end,
  },
  {
    "theniceboy/joshuto.nvim",
    lazy = false,
    config = function ()
      require("core.utils").load_mappings "joshuto"
    end,
  },
  {
    'aspeddro/gitui.nvim',
    lazy = false,
    config = function ()
      require("gitui").setup()
      require("core.utils").load_mappings "gitui"
    end,
  },
  {
    'nvim-telescope/telescope-symbols.nvim',
    lazy = false,
  },
  {
    "folke/which-key.nvim",
    keys = { '<leader>', '"', "'", '`', 'c', 'v', 'g', ';', ',', 'd', '[', ']' },
  },
}

return plugins
