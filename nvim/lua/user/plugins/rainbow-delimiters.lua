return {
  'HiPhish/rainbow-delimiters.nvim',
  config = function()
    require('rainbow-delimiters.setup').setup()
  end,
  dependencies = { 'gardgeoff/neovim-slime' },
  priority = 2000,
}
