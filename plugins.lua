local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  { import = "custom.configs.extras.copilot" },
  { import = "custom.configs.extras.diffview" },
  { import = "custom.configs.extras.mason-extras" },
  { import = "custom.configs.extras.symbols-outline" },
  { import = "custom.configs.extras.trouble" },
  { import = "custom.configs.extras.zen" },
  { import = "custom.configs.extras.toggleterm" },
  { import = "custom.configs.extras.smart-splits" },
  -- { import = "custom.configs.extras.repl" },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
    init = function()
      require("core.utils").load_mappings "mason"
    end,
  },

  {
    "folke/lazy.nvim",
    init = function()
      require("core.utils").load_mappings "lazy"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "andymass/vim-matchup",
      "HiPhish/nvim-ts-rainbow2",
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
      "jc-doyle/cmp-pandoc-references",
      "kdheepak/cmp-latex-symbols",
    },
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-hop.nvim",
      "nvim-telescope/telescope-bibtex.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "ahmedkhalf/project.nvim", -- defined in  ./editor.lua
    },
  },

  { "goolord/alpha-nvim",     enabled = false },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signcolumn = false,
      numhl = true,
      current_line_blame_opts = { ignore_whitespace = true },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "mxsdev/nvim-dap-vscode-js",
        opts = { debugger_cmd = { "js-debug-adapter" }, adapters = { "pwa-node" } },
      },
      { "theHamsta/nvim-dap-virtual-text", config = true },
      { "mfussenegger/nvim-dap-python" },
    },
  },

  {
    "arsham/indent-tools.nvim",
    dependencies = { "arsham/arshlib.nvim" },
    -- event = "User AstroFile",
    config = function()
      require("indent-tools").config {}
    end,
  },
  {
    "danymat/neogen",
    cmd = "Neogen",
    opts = {
      snippet_engine = "luasnip",
      languages = {
        lua = { template = { annotation_convention = "emmylua" } },
        typescript = { template = { annotation_convention = "tsdoc" } },
        typescriptreact = { template = { annotation_convention = "tsdoc" } },
      },
    },
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = "markdown",
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    event = "User AstroFile",
    cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
    opts = {},
  },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    init = function()
      require("core.utils").load_mappings "spectre"
    end,
  },
  {
    "willothy/flatten.nvim",
    lazy = false,
    priority = 1001,
    opts = {
      window = { open = "vsplit" },
    },
  },
  { "junegunn/vim-easy-align" },
  { "machakann/vim-sandwich" },
  { "wakatime/vim-wakatime" },

  {
    "p00f/clangd_extensions.nvim",
    -- init = function() table.insert(astronvim.lsp.skip_setup, "clangd") end,
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    -- opts = function() return { server = require("astronvim.utils.lsp").config "clangd" } end,
  },
  {
    "onsails/lspkind.nvim",
    opts = function(_, opts)
      -- use codicons preset
      -- opts.preset = "codicons"
      -- set some missing symbol types
      opts.symbol_map = {
        Array = "",
        Boolean = "",
        Key = "",
        Namespace = "",
        Null = "",
        Number = "",
        Object = "",
        Package = "",
        String = "",
      }
      return opts
    end,
  },
}

return plugins
