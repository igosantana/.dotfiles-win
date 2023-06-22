---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["Y"] = { "yg$" },
    ["<leader>of"] = { ":G<CR> <C-w>o", "Open vim fugitve" },
    ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "rename" },
    ["n"] = { "nzzzv", "cursor on the middle" },
    ["N"] = { "Nzzzv", "cursor on the middle" },
    ["<leader>y"] = { '\\"+y', "copy to system clipboard" },
    ["<leader>Y"] = { '\\"+Y', "copy to system clipboard" },
  },

  x = {
    ["<S-k>"] = { ":move '<-2<CR>gv-gv", "Move to up selected line/block" },
    ["<S-j>"] = { ":move '>+1<CR>gv-gv", "Move to down selecled line/block" },
  },

  v = {
    [">"] = { ">gv" },
    ["<"] = { "<gv" },
    ["p"] = { "_dp" },
    ["<leader>y"] = { '\\"+y', "copy to system clipboard" },
  },

  -- Toggleterm keymapping
  t = {
    ["<ESC>"] = { [[<C-\><C-n>]] },
    ["<C-h>"] = { [[<Cmd>wincmd h<CR>]] },
    ["<C-j>"] = { [[<Cmd>wincmd j<CR>]] },
    ["<C-k>"] = { [[<Cmd>wincmd k<CR>]] },
    ["<C-l>"] = { [[<Cmd>wincmd l<CR>]] },
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

    ["<leader>i"] = {
      function()
        require("nvim-tree.api").node.open.vertical()
      end,
    },
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
