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
    event = 'InsertEnter',
    config = function()
      require("core.utils").load_mappings "codeium"
    end
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function(_, opts)
      require("crates").setup(opts)
      require("crates").show()
    end
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = "neovim/nvim-lspconfig",
    ft = "rust",
    keys = { { ';R', "<cmd> RustRun <cr>", desc = 'Run current rust file' } },
    opts = require('custom.configs.rust-tools'),
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function(_, opts)
      require("core.utils").load_mappings "blankline"
      local p = require("base46").get_theme_tb "base_30"
      local hi = function(name, data) vim.api.nvim_set_hl(0, name, data) end
      vim.opt.termguicolors = true
      hi('IndentBlanklineChar',         { fg=p.purple})
      hi('IndentBlanklineSpaceChar',    { fg=p.yellow })
      hi('IndentBlanklineContextChar',  { fg=p.teal })
      hi('IndentBlanklineContextStart', { bg=p.grey })
      hi('IndentBlanklineIndent1',      { fg=p.blue,    bg=nil, nocombine=true })
      hi('IndentBlanklineIndent2',      { fg=p.cyan,    bg=nil, nocombine=true })
      hi('IndentBlanklineIndent3',      { fg=p.red,     bg=nil, nocombine=true })
      hi('IndentBlanklineIndent4',      { fg=p.azure,   bg=nil, nocombine=true })
      hi('IndentBlanklineIndent5',      { fg=p.green,   bg=nil, nocombine=true })
      hi('IndentBlanklineIndent6',      { fg=p.orange,  bg=nil, nocombine=true })
      opts.space_char_blankline = " "
      opts.char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      }
      require("indent_blankline").setup(opts)
    end,
  },
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
  },
  {
    'p00f/clangd_extensions.nvim',
    enabled = false,
    dependencies = "neovim/nvim-lspconfig",
    ft = {"c", "cpp"},
    opts = require('custom.configs.clangd-tools'),
  },
  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
  },

  {
    "oberblastmeister/zoom.nvim",
    keys = { { ';m', "<cmd> Zoom <cr>", desc = 'zoom toggle' } },
  },
  {
    "rqdmap/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { ';o', "<cmd> SymbolsOutline <cr>", desc = "toggle symbol outline" } },
    opts = require('custom.configs.symbols_outline'),
  },
  {
    "CRAG666/code_runner.nvim",
    cmd = { "RunCode", "RunFile", "RunProject", "RunClose", "CRFiletype", "CRProjects" },
    keys = { { ';r', "<cmd> RunCode <cr>", desc = "code run current file" } },
    opts = {
      mode = "float",
      startinsert = true,
      term = { tab = true, size = 15, },
    },
  },
  {
    "theniceboy/joshuto.nvim",
    keys = { { ';a', "<cmd> Joshuto <cr>", desc = "Joshuto" } },
  },
  {
    'aspeddro/gitui.nvim',
    keys = { { ';g', "<cmd> Gitui <cr>", desc = "gitui" } },
    opts = { command = { enable = true } },
  },
  {
    'nvim-telescope/telescope-symbols.nvim',
    keys = { { ';d', "<cmd> Telescope symbols <cr>", desc = "Emoji input" } },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim"
    },
    keys = { { ',a', "<cmd> Telescope file_browser <cr>", desc = "file browser" } },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
  {
    "gbprod/yanky.nvim",
    event = 'BufEnter',
    dependencies = "kkharji/sqlite.lua",
    opts = { ring = { storage =  "sqlite" } },
    keys = {
      { "<leader>y", "<cmd> Telescope yank_history <cr>", desc = "Open Yank History" },
    },
    config = function(_, opts)
      require("yanky").setup(opts)
      require("telescope").load_extension("yank_history")
    end,
  },
  {
    "folke/which-key.nvim",
    keys = { '<leader>', '"', "'", '`', 'c', 'v', 'g', ';', ',', 'd', '[', ']' },
  },
}

return plugins
