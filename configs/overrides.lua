local M = {}

M.treesitter = {
  ensure_installed = {
    'c', 'cpp', 'css', 'cmake', 'cuda', 'dot',
    'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore',
    'html', 'ini', 'java', 'json', 'jsonc', 'lua', 'luadoc',
    'make', 'markdown', 'markdown_inline', 'meson', 'ninja',
    'perl', 'python', 'rust', 'toml', 'typescript', 'vim', 'vimdoc', 'yaml',
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lsp server
    'bash-language-server',
    'yaml-language-server',
    'lua-language-server',
    'cmake-language-server',
    'python-lsp-server',
    'rust-analyzer',
    'clangd',

    -- format
    'prettier',
    'rustfmt',
    'stylua',
    'clang-format',
    'autopep8',
    'cmakelang',

    -- linting
    'shellcheck',
    'cmakelint',
    'clangcheck',
    'jsonlint',
    'markdownlint',
    'pylint',
  },
}

-- git support in nvimtree
M.nvimtree = require("plugins.configs.nvimtree")

M.nvimtree = {
  on_attach = require("custom.configs.nvimtree"),
  filters = {
    dotfiles = true,
    custom = { '*.o', '*.obj' },
  },
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        git = {
          unstaged = "",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

return M
