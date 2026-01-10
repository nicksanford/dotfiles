-- vim.o.noswapfile = true -- disable swapfiles
vim.o.swapfile = false -- disable swapfiles
-- line numbers
vim.o.nu = true  -- add line numbers
vim.o.rnu = true -- add relative line numbers

-- tabs & indentation
vim.o.autoindent = true -- indent a new line the same ammount as the line just typed
vim.o.expandtab = true  -- converts tabs to white space
vim.o.shiftwidth = 2
vim.o.softtabstop = 2   -- width of autoindents
vim.o.tabstop = 2       -- number of columns occupied by a tab

-- cursor line
vim.o.cursorline = true -- highlight current cursorline

--appearance
-- Default options:
local stauts, _ = pcall(vim.cmd, 'colorscheme solarized8_high')
if not stauts then
  print("Colorscheme not found!")
  return
end
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd('syntax on') -- syntax highlighting

--backspace
vim.o.backspace = "indent,eol,start" -- backspace works on every char in insert mode

-- clipboard
vim.o.clipboard = 'unnamedplus' -- using system clipboard filetype plugin on

-- mouse
-- vim.o.mouse = 'v'                    -- middle-click paste with
vim.o.mouse = 'a' -- enable mouse click

-- split windows
vim.o.splitright = true
vim.o.splitbelow = true

-- My config
vim.cmd('filetype plugin indent on') -- allow auto-indenting depending on file type
vim.o.showmatch     = true           -- show matching brackets
vim.o.wildmode      = 'longest,list' -- get bash-like tab completions
vim.o.ttyfast       = true           -- Speed up scroling in Vim
vim.o.listchars     = "tab:>~,nbsp:~,trail:."
vim.o.laststatus    = 2 -- always show status line
vim.o.completeopt   = 'menuone,noselect'

-- search
vim.o.hlsearch      = true -- highlight search
vim.o.ignorecase    = true -- case inensitive
vim.o.incsearch     = true -- incremental search
vim.o.smartcase     = true -- case insentive unless capitals used in search

-- line wrapping
vim.o.wrap          = true --do not wrap lines even if very long

---- FOUND CONFIG:
-- basic settings
vim.o.encoding      = "utf-8"
vim.o.history       = 1000
vim.o.dictionary    = '/usr/share/dict/words'
vim.o.startofline   = true

-- Mapping waiting time
vim.o.timeout       = false
vim.o.ttimeout      = true
vim.o.ttimeoutlen   = 100

-- Display
vim.o.scrolloff     = 3 -- always show 3 rows from edge of the screen
vim.o.synmaxcol     = 30000 -- stop syntax highlight after x lines for performance

vim.o.eol           = false -- show if there's no eol char
vim.o.foldenable    = false
vim.o.foldlevel     = 4 -- limit folding to 4 levels
vim.o.foldmethod    = 'syntax' -- use language syntax to generate folds
vim.o.list          = false -- do not display white characters
vim.o.showbreak     = '↪' -- character to show when line is broken

vim.o.matchtime     = 2 -- delay before showing matching paren
vim.o.mps           = vim.o.mps .. ",<:>"

-- White characters
vim.o.smartindent   = true
vim.o.formatoptions =
'qnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word

-- Commands mode
vim.o.wildmenu      = true -- on TAB, complete options for system command
vim.o.wildignore    =
'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'

-- try to stop flicker
vim.o.signcolumn    = "yes"
