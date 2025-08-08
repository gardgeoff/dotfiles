return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup({
      theme = 'doom',
      config = {
        header = {
          '',
          '',
          '',
          '',
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
          { icon = ' ', desc = 'New file', action = 'enew' },
          { icon = '󰱽 ', desc = 'Find file               ', key = 'Space + p', action = 'Telescope find_files' },
          { icon = ' ', desc = 'Recent files            ', key = 'Space + h', action = 'Telescope oldfiles' },
          { icon = '󰑑 ', desc = 'Find Word               ', key = 'Space + g', action = 'Telescope live_grep' },
        },
        footer = {},
      },
      hide = {
        statusline = false,
        tabline = false,
        winbar = false,
      },
    })

    vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#89b4fa' })
    vim.api.nvim_set_hl(0, 'DashboardDesc', { fg = '#89b4fa' })
    vim.api.nvim_set_hl(0, 'DashboardIcon', { fg = '#f5c2e7' })
    vim.api.nvim_set_hl(0, 'DashboardKey', { fg = '#fab387' })
    vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#6272a4' })
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
