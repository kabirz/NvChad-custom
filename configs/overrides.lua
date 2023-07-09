-- modify default config
-- treesitter
local treesitter = require("plugins.configs.treesitter")
treesitter.ensure_installed = {
  'c', 'cpp', 'css', 'cmake', 'cuda', 'dot',
  'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore',
  'html', 'ini', 'java', 'json', 'jsonc', 'lua', 'luadoc',
  'make', 'markdown', 'markdown_inline', 'meson', 'ninja',
  'perl', 'python', 'rust', 'toml', 'typescript', 'vim', 'vimdoc', 'yaml',
}

-- mason
local mason = require("plugins.configs.mason")
mason.ensure_installed = {
  -- lsp server
  'bash-language-server',
  'yaml-language-server',
  'lua-language-server',
  'neocmakelsp',
  'clangd',
  'deno',

  -- format
  'prettier',
  'stylua',

  -- linting
  'jsonlint',
  'markdownlint',
}
mason.PATH = "prepend";

-- gitsigns icon 
local signs = require("plugins.configs.others").gitsigns.signs
signs.add.text = ""
signs.change.text = ""

-- git support in nvimtree
local nvimtree = require("plugins.configs.nvimtree")
nvimtree.on_attach = require("custom.configs.nvimtree")
nvimtree.filters = { dotfiles = true, custom = { '*.o', '*.obj' }, }
nvimtree.git = { enable = true, }
nvimtree.renderer.highlight_git = true
nvimtree.renderer.icons.show = { git = true, }
nvimtree.renderer.icons.glyphs.git = {
  unstaged = "",
  staged = "✓",
  unmerged = "",
  renamed = "➜",
  untracked = "★",
  deleted = "",
  ignored = "",
}

