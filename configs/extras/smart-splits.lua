--@type NvChadConfig
local spec = {
  "mrjones2014/smart-splits.nvim",
  init = function()
    require("core.utils").load_mappings "smart_splits"
  end,
  opts = { ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" }, ignored_buftypes = { "nofile" } },
}

return spec
