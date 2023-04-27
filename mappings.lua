local utils = require "custom.utils"
--
---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}


M.toggleterm = {
  plugin = true,
  -- toggle comment in both modes
  n = {
    ["<leader>gl"] = {
      function()
        utils.toggle_term_cmd "lazygit"
      end,
      "ToggleTerm lazygit",
    },
    ["<leader>gg"] = {
      function()
        utils.toggle_term_cmd "lazygit"
      end,
      "ToggleTerm lazygit",
    },
  },
}

M.smart_splits = {
  plugin = true,
  n = {
    ["<C-h>"] = {
      function()
        require("smart-splits").move_cursor_left()
      end,
      desc = "Move to left split",
    },
    ["<C-j>"] = {
      function()
        require("smart-splits").move_cursor_down()
      end,
      desc = "Move to below split",
    },
    ["<C-k>"] = {
      function()
        require("smart-splits").move_cursor_up()
      end,
      desc = "Move to above split",
    },
    ["<C-l>"] = {
      function()
        require("smart-splits").move_cursor_right()
      end,
      desc = "Move to right split",
    },
    ["<C-Up>"] = {
      function()
        require("smart-splits").resize_up()
      end,
      desc = "Resize split up",
    },
    ["<C-Down>"] = {
      function()
        require("smart-splits").resize_down()
      end,
      desc = "Resize split down",
    },
    ["<C-Left>"] = {
      function()
        require("smart-splits").resize_left()
      end,
      desc = "Resize split left",
    },
    ["<C-Right>"] = {
      function()
        require("smart-splits").resize_right()
      end,
      desc = "Resize split right",
    },
  },
}

M.mason = {
  plugin = true,
  n = {
    ["<leader>pm"] = { "<cmd>Mason<cr>", "Mason Installer" },
    ["<leader>pM"] = { "<cmd>MasonUpdateAll<cr>", "Mason Update" },
  },
}

M.lazy = {
  plugin = true,
  n = {
    ["<leader>pi"] = {
      function()
        require("lazy").install()
      end,
      "Plugins Install",
    },
    ["<leader>ps"] = {
      function()
        require("lazy").home()
      end,
      "Plugins Status",
    },
    ["<leader>pS"] = {
      function()
        require("lazy").sync()
      end,
      "Plugins Sync",
    },
    ["<leader>pu"] = {
      function()
        require("lazy").check()
      end,
      "Plugins Check Updates",
    },
    ["<leader>pU"] = {
      function()
        require("lazy").update()
      end,
      "Plugins Update",
    },
  },
}

M.repl = {
  plugin = true,
  n = {
    ["<leader>rr"] = { "<Plug>Send", "Send to REPL" },
    ["<leader>rl"] = { "<Plug>SendLine", "Send line to REPL" },
    ["<leader>r<cr>"] = { "<cjd>SendHere<cr>", "Set REPL" },
  },
}

M.zen = {
  plugin = true,
  n = {
    ["<leader>z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },
  },
}

-- Extras example
-- M.symbols_outline = {
--   n = {
--     ["<leader>cs"] = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
--   },
-- }

-- more keybinds!

return M
