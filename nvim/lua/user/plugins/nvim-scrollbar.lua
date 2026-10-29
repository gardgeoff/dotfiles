return {
  'petertriho/nvim-scrollbar',
  branch = 'refactor/v2',
  opts = {
    exclude = {
      filetypes = { ['neo-tree'] = true },
    },
    marks = {
      Cursor = {
        text = ' ',
        priority = 99,
      },
    },
    scrollbar = {
      thumb = {
        blend = 90,
        highlight = 'Cursor',
      },
    },
  },
}
