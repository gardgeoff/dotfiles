return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    scope = {
      show_start = false,
    },
    exclude = {
      filetypes = {
        'dashboard',
      },
    },
  },
  config = function(_, opts)
    local hooks = require('ibl.hooks')
    local highlight = { 'IndentBlanklineCustom' }

    hooks.register(
      hooks.type.HIGHLIGHT_SETUP,
      function()
        vim.api.nvim_set_hl(0, 'IndentBlanklineCustom', { fg = '#2A2F30' })
      end
    )

    opts.indent = { highlight = highlight }
    opts.scope = vim.tbl_deep_extend('force', opts.scope or {}, {
      highlight = highlight,
    })

    require('ibl').setup(opts)
  end,
}
