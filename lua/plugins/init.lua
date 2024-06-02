return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "python",
        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "jsdoc",
        "json5",

        "c",
        "cpp",
      },
    },
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()
    end,
    lazy = false,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    ft = { "typescript", "javascript" },
    config = function()
      require "configs.tstools"
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    lazy = false,
    config = function()
      require("ufo").setup {
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
      }
    end,
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
    config = function()
      require "configs.treesitter"
    end,
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require "configs.treesitter"
    end,
    lazy = false,
  },

  { "tpope/vim-fugitive", lazy = false },
  {
    "stevearc/dressing.nvim",
    opts = {},
    lazy = false,
  },
  {
    "chrisgrieser/nvim-scissors",
    dependencies = { "nvim-telescope/telescope.nvim", "L3MON4D3/LuaSnip" },
    opts = {
      snippetDir = "~/.config/nvim/lua/snippets",
    },
    config = function() end,
  },
  {
    "akinsho/flutter-tools.nvim",
    -- lazy = false,
    ft={ "dart" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
  {'tpope/vim-abolish', lazy=false},
}
