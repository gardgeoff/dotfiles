return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      php = { 'pint' },
      blade = { 'blade_formatter' },
      html = { 'prettierd' },
      javascript = { 'eslint_d', stop_after_first = true },
      typescript = { 'eslint_d', stop_after_first = true },
      typescriptreact = { 'eslint_d', stop_after_first = true },
      lua = { 'stylua' },
    },
  },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format({ ansync = true })
      end,
      mode = '',
      desc = 'Format',
    },
  },
}
