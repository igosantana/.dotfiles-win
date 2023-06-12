---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["Y"] = { "yg$" },
    ["<leader>lg"] = { ":LazyGit<CR>", "Open Lazygit" },
  },

  x = {
    ["<S-k>"] = { ":move '<-2<CR>gv-gv", "Move to up selected line/block" },
    ["<S-j>"] = { ":move '>+1<CR>gv-gv", "Move to down selecled line/block" },
  },

  v = {
    [">"] = { ">gv" },
    ["<"] = { "<gv" },
    ["p"] = { "_dp" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    ["<leader>o"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.gitsigns = {
  plugin = true,
  n = {
    ["<leader>rb"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      "Reset buffer hunk",
    },
    ["<leader>sh"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage hunk",
    },
    ["<leader>uh"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "Undo stage hunk",
    },
  },
}

return M
