-- import nvim-treesitter plugin safely
local status, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not status then
  print("nvim-treesitter.configs not installed")
  return
end

local config = {
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      -- keymaps = {
      --   -- You can use the capture groups defined in textobjects.scm
      --   ['aa'] = '@parameter.outer',
      --   ['ia'] = '@parameter.inner',
      --   ['af'] = '@function.outer',
      --   ['if'] = '@function.inner',
      --   ['ac'] = '@class.outer',
      --   ['ic'] = '@class.inner',
      -- },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    -- swap = {
    --   enable = true,
    --   swap_next = {
    --     ['<leader>a'] = '@parameter.inner',
    --   },
    --   swap_previous = {
    --     ['<leader>A'] = '@parameter.inner',
    --   },
    -- },
  },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "dockerfile",
    "elixir",
    "erlang",
    "gitignore",
    "go",
    "javascript",
    "json",
    "lua",
    "luadoc",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "typescript",
    "vim",
    "yaml",
  },
  -- auto install above language parsers
  auto_install = true,
}

treesitter_config.setup(config)
