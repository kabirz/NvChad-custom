local overrides = require("custom.configs.overrides")

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

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "AckslD/nvim-neoclip.lua",
    lazy = false,
    dependencies = {
      { 'kkharji/sqlite.lua' },
      { "nvim-telescope/telescope.nvim" },
    },
    opts = require("custom.configs.neoclip"),
    config = function(_, opts)
      require('neoclip').setup(opts)
      require('telescope').load_extension('neoclip')
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = require("custom.others").gitsigns ,
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
    opts = require("custom.utils").rust_opts,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end
  },
  {
    'p00f/clangd_extensions.nvim',
    dependencies = "neovim/nvim-lspconfig",
    ft = {"c", "cpp"},
    opts = require("custom.utils").clangd_opts,
    config = function(_, opts)
      require("clangd_extensions").setup(opts)
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
    'dhruvasagar/vim-zoom',
    lazy = false,
    config = function()
      require("core.utils").load_mappings "zoom"
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    lazy = false,
    opts = require('custom.configs.symbols_outline'),
    config = function(_, opts)
      require("symbols-outline").setup(opts)
      require("core.utils").load_mappings "outline"
    end
  },
  {
    'TimUntersberger/neogit',
    lazy = false,
    cmd = "Neogit",
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require("core.utils").load_mappings "neogit"
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
    lazy = false,
    cmd = { "RunCode", "RunFile", "RunProject", "RunClose", "CRFiletype", "CRProjects" },
    opts = require("custom.configs.code_runner"),
    config = function (_, opts)
      require("core.utils").load_mappings "code_runner"
      require("code_runner").setup(opts)
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
    "folke/which-key.nvim",
    keys = { '<leader>', '"', "'", '`', 'c', 'v', 'g', ';', ',', 'd', '[', ']' },
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
