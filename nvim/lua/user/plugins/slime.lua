return {
  'gardgeoff/slime.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require('slime').setup(opts)
    vim.cmd('colorscheme slime')
  end,
}
