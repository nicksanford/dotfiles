-- -- Install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require('lazy').setup({
  -- https://github.com/nvim-tree/nvim-tree.lua
  -- A file explorer tree for neovim written in lua
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  },

  -- https://github.com/nvim-lualine/lualine.nvim
  -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
  },

  -- https://github.com/tpope/vim-sensible
  -- Defaults everyone can agree on
  { 'tpope/vim-sensible' },

  -- https://github.com/tpope/vim-fugitive
  -- A Git wrapper so awesome, it should be illegal
  { 'tpope/vim-fugitive' },

  -- https://github.com/godlygeek/tabular
  -- Vim script for text filtering and alignment
  { 'godlygeek/tabular' },

  -- TMUX PLUGINS
  -- https://github.com/christoomey/vim-tmux-navigator
  -- Seamless navigation between tmux panes and vim splits
  { 'christoomey/vim-tmux-navigator' },
  -- COLORSCHEME PLUGINS

  -- https://github.com/rafi/awesome-vim-colorschemes
  -- Collection of awesome color schemes for Neo/vim, merged for quick use.
  { 'rafi/awesome-vim-colorschemes' },

  -- GOLANG PLUGINS
  { 'fatih/vim-go' },

  -- ELIXIR PLUGINS
  -- https://github.com/elixir-editors/vim-elixir
  -- Vim configuration files for Elixir
  { 'elixir-editors/vim-elixir' },
  -- https://github.com/mhanberg/elixir.nvim
  -- Neovim plugin for Elixir
  { 'mhanberg/elixir.nvim',                     dependencies = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim' } },

  -- TELESCOPE
  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim',            tag = 'v0.2.1',                                                      dependencies = { 'nvim-lua/plenary.nvim' } },
  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  -- AUTOCOMPLETE & SNIPITS
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',             -- snippet engine
      'saadparwaiz1/cmp_luasnip',     -- for autocompletion
      'rafamadriz/friendly-snippets', -- useful snippets
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline'
    },
  },

  -- CONFIGURING LSP SERVERS
  {
    "mason-org/mason-lspconfig.nvim",
    tag = 'v2.1.0',
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "nvimdev/lspsaga.nvim", -- enhanced lsp uis
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'onsails/lspkind.nvim' }, -- vs-code like icons for autocompletion
  -- tresitter
  -- treesitter configuration
  { "nvim-treesitter/nvim-treesitter", tag = 'v0.10.0', build = ":TSUpdate" },
  -- Additional text objects via treesitter
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  -- auto closing
  -- autoclose parens, brackets, quotes, etc...
  { "windwp/nvim-autopairs" },
  -- autoclose tags
  {
    "windwp/nvim-ts-autotag",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  -- Show Keymaps: https://github.com/folke/which-key.nvim
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    dependencies = {
      { 'echasnovski/mini.nvim', version = '*' }
    }
  }
})
