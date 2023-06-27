---@type MappingsTable
local M = {}
M.general = {
  n = {
    ["bl"] = { "<cmd> bnext <CR>", "Goto next buffer" },
    ["bh"] = { "<cmd> bprevious <CR>", "Goto prev tab" },
    ["bf"] = { "<cmd> bfirst <CR>", "Goto first tab" },
    ["be"] = { "<cmd> blast <CR>", "Goto last tab" },
    ["bd"] = { "<cmd> bd <CR>", "close current file" },
    ["tl"] = { "<cmd> tabnext <CR>", "Goto next tab" },
    ["th"] = { "<cmd> tabprevious <CR>", "Goto prev tab" },
    ["tf"] = { "<cmd> tabfirst <CR>", "Goto first tab" },
    ["te"] = { "<cmd> tablast <CR>", "Goto last tab" },
    ["gk"] = { "<cmd> Man <CR>", "Goto manual" },
    [";h"] = { "<C-w>h", "Window left" },
    [";l"] = { "<C-w>l", "Window right" },
    [";j"] = { "<C-w>j", "Window down" },
    [";k"] = { "<C-w>k", "Window up" },
    [';q'] = { "<cmd> cclose <CR>", "close quickfix list" },
  },
}

M.codeium = {
  plugin = true,
  i = {
    ['<C-]>'] = { vim.fn["codeium#Accept"], 'codeium accept', opts = { expr = true }},
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    ["<leader>a" ] = { function() vim.cmd(string.format("NvimTreeToggle %s", vim.fn.expand("%:p:h"))) end, "Toggle current file nvimtree" },
  },
}

M.rust_tools = {
  plugin = true,
  n = {
    [';r'] = {"<cmd> RustRun <CR>", "Run current file" },
  }
}

M.zoom = {
  plugin = true,
  n = {
	  [';m']  = {'<Plug>(zoom-toggle)', 'zoom toggle'},
  },
}

M.outline = {
  plugin = true,
  n = {
    [';o'] = {"<cmd> SymbolsOutline <CR>", "toggle symbol outline"},
  }
}

M.neogit = {
  plugin = true,
  n = {
    [';g'] = {"<cmd> Neogit <CR>", "Neogit"},
  }
}

M.nvterm = {
  plugin = true,
  n = {
    -- new
    [",h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },

    [",v"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
    ['<leader>h'] = { '<>', 'none' },
    ['<leader>v'] = { '<>', 'none' },
  },
}
-- more keybinds!

return M
