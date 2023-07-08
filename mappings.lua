---@type MappingsTable
local M = {}
M.general = {
  n = {
    ["bl"] = { "<cmd> bnext <cr>", "Goto next buffer" },
    ["bh"] = { "<cmd> bprevious <cr>", "Goto prev tab" },
    ["bf"] = { "<cmd> bfirst <cr>", "Goto first tab" },
    ["be"] = { "<cmd> blast <cr>", "Goto last tab" },
    ["bd"] = { "<cmd> bd <cr>", "close current file" },
    ["tl"] = { "<cmd> tabnext <cr>", "Goto next tab" },
    ["th"] = { "<cmd> tabprevious <cr>", "Goto prev tab" },
    ["tf"] = { "<cmd> tabfirst <cr>", "Goto first tab" },
    ["te"] = { "<cmd> tablast <cr>", "Goto last tab" },
    ["td"] = { "<cmd> tabclose <cr>", "close current tab" },
    ["gk"] = { "<cmd> Man <cr>", "Goto manual" },
    [";h"] = { "<C-w>h", "Window left" },
    [";l"] = { "<C-w>l", "Window right" },
    [";j"] = { "<C-w>j", "Window down" },
    [";k"] = { "<C-w>k", "Window up" },
    [';q'] = { "<cmd> cclose <cr>", "close quickfix list" },
    [';c'] = { "<cmd> edit " .. vim.fn.stdpath('config') .. "/lua/custom/init.lua <cr>", "open custom config" },
  },
}

M.telescope = {
  plugin = true,
  n = {
    [",f"] = { "<cmd> Telescope grep_string <cr>", "Find strings" },
    [",c"] = { "<cmd> Telescope command_history <cr>", "command history" },
    [",C"] = { "<cmd> Telescope commands <cr>", "commands" },
    -- git
    [",gc"] = { "<cmd> Telescope git_commits <cr>", "git commits" },
    [",gb"] = { "<cmd> Telescope git_bcommits <cr>", "git buffer commits" },
    [",gB"] = { "<cmd> Telescope git_branches <cr>", "git branch" },
    [",gs"] = { "<cmd> Telescope git_status <cr>", "git status" },

    [",s"] = { "<cmd> Telescope symbols <cr>", "Emoji input" },
    [",m"] = { "<cmd> Telescope marks <cr>", "marks" },
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
    [';R'] = {"<cmd> RustRun <cr>", "Run current rust file" },
  }
}

M.zoom = {
  plugin = true,
  n = {
    [';m']  = { "<cmd> Zoom <cr>", 'zoom toggle' },
  },
}

M.outline = {
  plugin = true,
  n = {
    [';o'] = {"<cmd> SymbolsOutline <cr>", "toggle symbol outline"},
  }
}

M.code_runner = {
  plugin = true,
  n = {
    [';r'] = {"<cmd> RunCode <cr>", "code run current file"},
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

M.lspconfig = {
  plugin = true,
  n = {
    ["gd"] = { "<cmd> Telescope lsp_definitions <cr>", "LSP definition" },
    ["gi"] = { "<cmd> Telescope lsp_implementations <cr>", "LSP implementation" },
    ["dD"] = { "<cmd> Telescope lsp_type_definitions <cr>", "LSP definition type" },
    ["gr"] = { "<cmd> Telescope lsp_references <cr>", "LSP references" },
    ["gs"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols <cr>", "LSP workspace symbols" },
  },
  v = {
    ["m"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting selected buffer",
    },
  }
}

M.joshuto = {
  plugin = true,
  n = {
    [";a"] = { "<cmd> Joshuto <cr>", "Joshuto" },
  },
}

M.gitui = {
  plugin = true,
  n = {
    [";g"] = { function () require("gitui").open() end, "gitui" },
  },
}
-- more keybinds!

return M
