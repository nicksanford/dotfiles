local map = function(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true })
end

local nmap = function(shortcut, command, desc)
  map('n', shortcut, command, { desc = desc })
end

-- Remap ; to C-w for buffer managemet
vim.cmd('noremap <C-=> <C-w>=')
-- Remap Ctrl-_ to <C-w>_ for buffer managemet
nmap("<C-_>", "<C-w>_")
nmap("<C-\\>", "<C-w>|")
nmap("<C-x>", "ZQ")

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })


-- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', ":w<CR>", { desc = '[ ] Save' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [D]Buffers' })
vim.keymap.set('n', '<leader>c', ":e ~/.config/nvim/init.lua<CR>", { desc = '[C]onfig', noremap = true, silent = true })

-- nvim-tree
nmap("<leader>e", ":NvimTreeToggle<CR>")
