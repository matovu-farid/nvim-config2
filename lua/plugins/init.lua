return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = {},
    config = function()
      require "configs.conform"
    end,
  },
  {
  "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "bash /usr/local/bin/get_openai_key",
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
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
      require("oil").setup {
        view_options = {
          -- show_hidden = true
        },
      }
    end,
    lazy = false,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    ft = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
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
    ft = { "dart" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
  { "tpope/vim-abolish", lazy = false },
  { "tpope/vim-surround", lazy = false },
  {
    "coffebar/neovim-project",
    opts = {
      projects = { -- define project roots
        "~/projects/*",
        "~/.config/*",
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append "globals" -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
    config = function()
      require("neovim-project").setup {
        dashboard_mode = true,
      }
    end,
  },
  {
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    -- event= "BufEnter */**/package.json"
  },
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   ---@type Flash.Config
  --   opts = {},
  -- -- stylua: ignore
  -- keys = {
  --   { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  --   { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  --   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  --   { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  --   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  -- },
  -- },
  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("competitest").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "https://git.sr.ht/~swaits/scratch.nvim",
    lazy = true,
    keys = {
      { "<leader>bs", "<cmd>Scratch<cr>", desc = "Scratch Buffer", mode = "n" },
      { "<leader>bS", "<cmd>ScratchSplit<cr>", desc = "Scratch Buffer (split)", mode = "n" },
    },
    cmd = {
      "Scratch",
      "ScratchSplit",
    },
    opts = {},
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require "configs.terminal"
    end,
  },
  { "tpope/vim-rails", lazy = false },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      require "configs.autotag"
    end,
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {}, -- your configuration
    config = function()
      require("tailwind-tools").setup {
        -- your configuration
      }
    end,
  },
  {
    "nvim-tree/nvim-tree/nvim-tree.lua",
    enabled = false,
  },

  {
    "tpope/vim-dispatch",
    lazy = false,
  },
  {
    "tpope/vim-dadbod",
    lazy = false,
  },
  {
    "tpope/vim-unimpaired",
    lazy = false,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "arminveres/md-pdf.nvim",
    branch = "main", -- you can assume that main is somewhat stable until releases will be made
    lazy = true,
    keys = {
      {
        "<leader>,",
        function()
          require("md-pdf").convert_md_to_pdf()
        end,
        desc = "Markdown preview",
      },
    },
    opts = {},
  },
}
