--- This will install copilot.lua and copilot
--- This should not be used in tandem with copilot-cmp module
--- The plugins are created by one of NvChad's member: zbirenbaum :D
--- For more information, read https://github.com/zbirenbaum/copilot.lua
--- Feel free to override the defaults of copilot.lua, using a spec, such as:
--- ```
--- {
---   "zbirenbaum/copilot.lua",
---   opts = function(_, opts --[[NvChad's default opts]])
---     -- Return the modified opts table
---   end,
--- }
--- ```

---@type NvPluginSpec
local spec = {
  -- copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    --opts = overrides.copilot, -- have your own local overrided configurations in: custom/configs/overrides.lua
    config = function()
      require("copilot").setup {
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "right", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          --auto_trigger = false, -- if autocomplete menu doesn't show while you type, setting this to true is recommended
          auto_trigger = true, -- if autocomplete menu doesn't show while you type, setting this to true is recommended
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            --dismiss = "<C-]>",
            dismiss = "<C-e>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          javascript = true, -- allow specific filetype
          typescript = true, -- allow specific filetype
          ["."] = false,
          --["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
          sh = function()
            if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
              -- disable for .env files
              return false
            end
            return true
          end,
        },
        copilot_node_command = "node", -- Node.js version must be > 16.x
        server_opts_overrides = {
          trace = "verbose",
          settings = {
            advanced = {
              listCount = 6,          -- #completions for panel
              inlineSuggestCount = 5, -- #completions for getCompletions
            },
          },
        },
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = function(_, opts)
      local cmp, copilot = require "cmp", require "copilot.suggestion"
      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then
        return
      end
      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end
      if not opts.mapping then
        opts.mapping = {}
      end
      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if copilot.is_visible() then
          copilot.accept()
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" })

      opts.mapping["<C-x>"] = cmp.mapping(function()
        if copilot.is_visible() then
          copilot.next()
        end
      end)

      opts.mapping["<C-z>"] = cmp.mapping(function()
        if copilot.is_visible() then
          copilot.prev()
        end
      end)

      return opts
    end,
  },
  -- copilot cmp source
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     {
  --       "zbirenbaum/copilot-cmp",
  --       dependencies = "copilot.lua",
  --       opts = {},
  --       config = function(_, opts)
  --         local copilot_cmp = require "copilot_cmp"
  --         copilot_cmp.setup(opts)
  --         -- attach cmp source whenever copilot attaches
  --         -- fixes lazy-loading issues with the copilot cmp source
  --         require("custom.utils").on_attach(function(client)
  --           if client.name == "copilot" then
  --             copilot_cmp._on_insert_enter()
  --           end
  --         end)
  --       end,
  --     },
  --   },
  --   opts = function(_, opts)
  --     local cmp = require "cmp"
  --
  --     table.insert(opts.sources, 1, { name = "copilot", group_index = 2 })
  --
  --     local confirm = opts.mapping["<CR>"]
  --     local confirm_copilot = cmp.mapping.confirm {
  --       select = true,
  --       behavior = cmp.ConfirmBehavior.Replace,
  --     }
  --
  --     opts.sources = {
  --       { name = "nvim_lsp" },
  --       { name = "luasnip" },
  --       { name = "buffer" },
  --       { name = "nvim_lua" },
  --       { name = "path" },
  --       { name = "copilot" },
  --     }
  --
  --     opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --       ["<CR>"] = function(...)
  --         local entry = cmp.get_selected_entry()
  --         if entry and entry.source.name == "copilot" then
  --           return confirm_copilot(...)
  --         end
  --         return confirm(...)
  --       end,
  --     })
  --     opts.sorting = {
  --       priority_weight = 2,
  --       comparators = {
  --         require("copilot_cmp.comparators").prioritize,
  --
  --         -- Below is the default comparitor list and order for nvim-cmp
  --         cmp.config.compare.offset,
  --         -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
  --         cmp.config.compare.exact,
  --         cmp.config.compare.score,
  --         cmp.config.compare.recently_used,
  --         cmp.config.compare.locality,
  --         cmp.config.compare.kind,
  --         cmp.config.compare.sort_text,
  --         cmp.config.compare.length,
  --         cmp.config.compare.order,
  --       },
  --     }
  --   end,
  -- },
}

return spec
