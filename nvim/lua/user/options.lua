-- Tab settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Auto indent for {}
vim.opt.smartindent = true

-- Disabled line wrapping
vim.opt.wrap = true

-- Display line numbers
vim.opt.number = true


vim.opt.relativenumber = true

-- complete the longest common match, and llow tabbing the ressults to fully complete them
vim.opt.wildmode = 'longest:full,full'

vim.opt.title = true
vim.opt.mouse = 'a'

vim.opt.termguicolors = true

-- Turn on spell check
vim.opt.spell = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true
vim.opt.listchars = { trail = '*' }
-- Remove ~ on empty lines
vim.opt.fillchars = { eob = ' ' }


vim.opt.splitbelow = true
vim.opt.splitright = true


vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Use one clipboard
vim.opt.clipboard = 'unnamedplus'

-- Ask for confirm when quit
vim.opt.confirm = true

-- Persistent undo
vim.opt.undofile = true
-- Automatic backup of file
vim.opt.backup = true
-- Dont use current directory for backups
vim.opt.backupdir:remove('.')
