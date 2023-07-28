-- Set Space for leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- When text is wrapped, move by terminal rows, not lines, unelss a count is provided.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true})
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true})

-- Reselect visual selection after indeinting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain cursor pos after yanking visual selection
vim.keymap.set('v', 'y', 'myy`y')

-- Disable :q typo
vim.keymap.set('n', 'q:', ':q')

-- Paste replace visual selection without copying
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of trailing ; or , from insert mode
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('i', ',,', '<Esc>A,')

-- Clear search highlighting
vim.keymap.set('n', '<Leader>H', ':nohlsearch<CR>')

--Open current file in default program
vim.keymap.set('n', '<Leader>x', ':!wsl-open %<CR><CR>')

-- Some cool line manipulation
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<A-k>', ':move .-2<CR>==gi')
vim.keymap.set('n', '<A-j>', ':move .+1<CR>==gi')
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv-gv")
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv-gv")
