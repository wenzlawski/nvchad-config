--@type NVPluginSpec
local spec = {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  init = function()
    require("core.utils").load_mappings("zen")
  end,
  opts = {
    window = {
      backdrop = 1,
      height = 0.9,
      options = {
        number = false,
        relativenumber = false,
        foldcolumn = "0",
        list = false,
        showbreak = "NONE",
        signcolumn = "no",
      },
    },
    plugins = {
      options = {
        cmdheight = 1,
        laststatus = 0,
      },
    },
  },
}

return spec
