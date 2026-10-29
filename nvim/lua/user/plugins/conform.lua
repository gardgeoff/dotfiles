return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      php = { 'pint' },
      blade = { 'blade-formatter' },
      html = { 'prettierd' },
      javascript = { 'eslint_d', stop_after_first = true },
      typescript = { 'eslint_d', stop_after_first = true },
      typescriptreact = { 'eslint_d', stop_after_first = true },
      lua = { 'stylua' },
      gdscript = { 'gdformat' },
    },
  },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format({ async = true, lsp_format = 'fallback' })
      end,
      mode = '',
      desc = 'Format',
    },
  },
}
