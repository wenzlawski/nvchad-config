--@type NvPluginSpec
local spec = {
  "pappasam/nvim-repl",
  init = function ()
    require("core.utils").load_mappings "repl"
  end
}

return spec
