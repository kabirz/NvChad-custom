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
    opts = require("custom.nvim-tree-on-attach").opts,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)

      vim.g.nvimtree_side = opts.view.side
      -- auto close
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
        pattern = "NvimTree_*",
        callback = function()
          local layout = vim.api.nvim_call_function("winlayout", {})
          if layout[1] == "leaf" and
            vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
            and layout[3] == nil then
            vim.cmd("confirm quit") end
        end
      })
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    lazy = false,
    dependencies = {
      { 'kkharji/sqlite.lua', module = 'sqlite' },
      { "nvim-telescope/telescope.nvim"},
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
    'mhinz/vim-startify',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
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
