db = require('dashboard')

db.setup({
  theme = 'doom',
  config = {
    header = {
      '',
      '',
    ' ██████╗ ███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
    '██╔════╝ ██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
    '██║  ███╗█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
    '██║   ██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
    '╚██████╔╝███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
    ' ╚═════╝ ╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
    '',
    '',
    '',
    },
    center = {
      {
        icon = '  ',
        desc = 'Find file',
        shortcut = 'SPC f',
        action = 'Telescope find_files'
      },
      {
        icon = '  ',
        desc = 'New File           ',
        action = 'enew'
      },
      {
        icon = '  ',
        desc = 'Recent files',
        shortcut = 'SPC h',
        action = 'Telescope oldfiles'
      },
      {
        icon = '  ',
        desc = 'Find word',
        shortcut = 'SPC g',
        action = 'Telescope live_grep'
      },
    },
  },
  footer = {}
})
vim.cmd([[
  augroup DashboardHighlights
    autocmd ColorScheme * highlight DashboardHeader guifg=#89B4FA
    autocmd ColorScheme * highlight DashboardCenter guifg=#f8f8f2
    autocmd ColorScheme * highlight DashboardShortcut guifg=#bd93f9
    autocmd ColorScheme * highlight DashboardFooter guifg=#6272a4
  augroup end
]])
vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = '#f8f8f2' })
vim.api.nvim_set_hl(0, 'DashboardShortcut', { fg = '#bd93f9' })
vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#6272a4' })
