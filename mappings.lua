---@type MappingsTable
local M = {}
M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["bl"] = { function() vim.cmd("bnext") end, "Goto next buffer" },
    ["bh"] = { function() vim.cmd("bprevious") end, "Goto prev tab" },
    ["bf"] = { function() vim.cmd("bfirst") end, "Goto first tab" },
    ["be"] = { function() vim.cmd("blast") end, "Goto last tab" },
    ["gb"] = { function() vim.cmd("bd") end, "close current file" },
    ["tl"] = { function() vim.cmd("bnext") end, "Goto next tab" },
    ["th"] = { function() vim.cmd("tabprevious") end, "Goto prev tab" },
    ["tf"] = { function() vim.cmd("tabfirst") end, "Goto first tab" },
    ["te"] = { function() vim.cmd("tablast") end, "Goto last tab" },
    ["gk"] = { function() vim.cmd("Man") end, "Goto manual" },
    ["<leader>h"] = { "<C-w>h", "Window left" },
    ["<leader>l"] = { "<C-w>l", "Window right" },
    ["<leader>j"] = { "<C-w>j", "Window down" },
    ["<leader>k"] = { "<C-w>k", "Window up" },


  },
}

M.nvimtree = {
  n = {
    ["<leader>a" ] = { function ()
      require("nvim-tree.api").tree.toggle{focus = true, path = vim.fn.expand('%:p:h')}
    end, "Toggle current file nvimtree"
    },
    ["<leader>e" ] = { function ()
      require("nvim-tree.api").tree.toggle{focus = true, path = vim.fn.getcwd()}
    end, "Toggle cwd nvimtree"
    },
  },
}

-- more keybinds!

return M
