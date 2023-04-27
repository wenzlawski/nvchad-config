local utils = require("custom.utils")
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
    ["<leader>gl"] = { function() utils.toggle_term_cmd "lazygit"  end, "ToggleTerm lazygit" },
    ["<leader>gg"] = { function() utils.toggle_term_cmd "lazygit"  end, "ToggleTerm lazygit" },
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
