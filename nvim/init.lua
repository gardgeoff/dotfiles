
require('user.options')
require('user.keymaps')
require('user.misc')
require('user.plugins')
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'php' },
  callback = function()
    vim.treesitter.start()
  end,
})
