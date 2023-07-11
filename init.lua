-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.opt.whichwrap = "<>[]"
vim.g.python3_host_prog = "/usr/bin/python3"
local enable_providers = {
  "python3_provider",
  "node_provider",
}

for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end

-- sw: shiftwidth
-- sts: softtabstop 
-- ts: tabstop
-- et/noet: expandtab/noexpandtab
-- cc: colorcolumn
vim.cmd([[
  au FileType c,cpp                setlocal sw=4 sts=4 ts=4 noet cc=96
  au FileType rust                 setlocal sw=4 sts=4 ts=4 et   cc=80
  au filetype python               setlocal sw=4 sts=4 ts=4 et   cc=80
  au filetype lua,json,yaml,toml   setlocal sw=2 sts=2 ts=2 et   cc=96
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
]])

require('custom.configs.overrides')

