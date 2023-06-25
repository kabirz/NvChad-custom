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
    "bash-language-server",
    'yaml-language-server',
    "lua-language-server",
    "cmake-language-server",
    "rust-analyzer",
    "clangd",
    "clang-format",
    'python-lsp-server',
    'cmakelint',
    'cpplint',
    'jsonlint',
    'markdownlint',
    'pylint',
    'shellcheck'
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
