# NvChad config by Marc


### Custom plugins

( put links here )
- toggleterm
- copilot
- diffview
- trouble
- zen
- smart-splits
- nvim-dap
- gitsigns
- indent-tools
- neogen
- headlines
- todo-comments
- nvim-spectre
- flatten
- vim-easy-align
- vim-sandwich
- vim-wakatime
- clangd_extensions


## Sturcture


( This is not completely followed as of yet, hence more aspirational )

`plugins.lua` contains all plugin definitions, as show in the template section.

`custom/configs/extras` contains all plugin configs.

`mappins.lua` contains all mappigs duh.

`utils.lua` for utility functions.


## Templates
To use an extension, add a line of
```lua
    { import = "custom.configs.extras.file_name_without_dot_lua" },
```
to the end of the plugin spec table inside `plugins.lua` use one of the extensions

```lua
---@type NvPluginSpec
local spec = {
    "author/plugin-name",
    name = name,
    init = function()
        require("core.utils").load_mappings "plugin_name"
    end,
    opts = {}
    config = function()
        require("plugin_name").setup()
    end
}

return spec
```
