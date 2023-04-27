--@type NvPluginSpec
local spec = {
  "akinsho/toggleterm.nvim",
  init = function()
    require("core.utils").load_mappings "toggleterm"
  end,
  cmd = { "ToggleTerm", "TermExec" },
  opts = {
    size = 10,
    open_mapping = [[<F7>]],
    shading_factor = 2,
    direction = "float",
    float_opts = {
      border = "curved",
      highlights = { border = "Normal", background = "Normal" },
    },
  },
}

return spec
