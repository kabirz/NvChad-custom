local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with {
    filetypes = {
      "vue",
			"typescript",
			"javascript",
			"typescriptreact",
			"javascriptreact",
			"yaml",
			"html",
			"css",
			"scss",
			"sh",
			"markdown",
    }
  }, -- so prettier works only on these filetypes

  -- python
  b.formatting.autopep8.with { filetypes = { "python" } },
  -- Lua
  b.formatting.stylua,
  -- cmake
  b.formatting.cmake_format.with { filetypes = { "cmake" } },
  -- rust
  b.formatting.rustfmt,

  -- cpp
  b.formatting.clang_format.with {
    filetypes = { "c", "cpp" },
    extra_args = {
      "--style=file:".. vim.fn.stdpath "config" .. "/lua/custom/configs/.clang-format"
    },
  },
  -- lint
  -- cpp
  b.diagnostics.clang_check,
  -- shell
  b.diagnostics.shellcheck,
  -- cmake
  b.diagnostics.cmake_lint,
  -- markdown
  b.diagnostics.markdownlint,
  -- json
  b.diagnostics.jsonlint,
  -- python
  b.diagnostics.pylint,

  -- actions
  b.completion.spell,
  b.completion.luasnip,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
