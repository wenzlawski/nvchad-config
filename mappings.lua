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

-- M.mason = {
--   plugin = true,
--   n = {
--     ["<leader>pm"] = { "<cmd>Mason<cr>", "Mason Installer" },
--     ["<leader>pM"] = { "<cmd>MasonUpdateAll<cr>", "Mason Update" },
--   },
-- }

-- Extras example
-- M.symbols_outline = {
--   n = {
--     ["<leader>cs"] = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
--   },
-- }

-- more keybinds!

return M
