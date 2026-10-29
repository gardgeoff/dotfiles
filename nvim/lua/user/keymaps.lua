-- Space is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Quickly clear search highlighting.
vim.keymap.set('n', '<leader>k', ':nohlsearch<CR>')

-- Close split if available, otherwise close buffer.
-- Floating windows and neo-tree don't count as splits.
vim.keymap.set('n', '<leader>q', function()
  local function is_split(win)
    return vim.api.nvim_win_get_config(win).relative == ''
      and vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= 'neo-tree'
  end
  local splits = vim.tbl_filter(is_split, vim.api.nvim_tabpage_list_wins(0))
  if #splits > 1 or not is_split(0) then
    vim.cmd('close')
  else
    require('user.bufdelete')(0)
  end
end, { silent = true })

-- Make :bd / :bdelete keep the window open too, so neo-tree isn't left filling the screen.
vim.api.nvim_create_user_command('Bdelete', function(opts)
  local buf = opts.args == '' and 0 or tonumber(opts.args) or vim.fn.bufnr(opts.args)
  if buf ~= 0 and not vim.api.nvim_buf_is_valid(buf) then
    vim.notify('E94: No matching buffer for ' .. opts.args, vim.log.levels.ERROR)
    return
  end
  require('user.bufdelete')(buf, opts.bang)
end, { bang = true, nargs = '?', complete = 'buffer' })
vim.cmd([[cnoreabbrev <expr> bd getcmdtype() == ':' && getcmdline() ==# 'bd' ? 'Bdelete' : 'bd']])
vim.cmd([[cnoreabbrev <expr> bdelete getcmdtype() == ':' && getcmdline() ==# 'bdelete' ? 'Bdelete' : 'bdelete']])

-- Make splits
vim.keymap.set('n', '<leader>vs', ':vs<CR>')
vim.keymap.set('n', '<leader>hs', ':split<CR>')

-- Allow gf to open non-existent files.
vim.keymap.set('', 'gf', ':edit <cfile><CR>')

-- Reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of trailing ; or , from normal mode
vim.keymap.set('n', '<leader>;', 'A;<Esc>')
vim.keymap.set('n', '<leader>,', 'A,<Esc>')

-- Open the current file in the default program (on Mac this should just be just `open`).
vim.keymap.set('n', '<leader>x', ':!xdg-open %<cr><cr>')

-- Disable annoying command line thing.
vim.keymap.set('n', 'q:', ':q<CR>')

-- Resize with arrows.
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- Normie file manipulation
vim.keymap.set('n', '<C-s>', ':up <CR>')

-- Comment a paragraph, maintaining cursor position
vim.keymap.set('n', 'gcap', 'my<cmd>norm vip<bar>gc<cr>`y')
