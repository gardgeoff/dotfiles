return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim' },
  },
  build = 'make tiktoken',
  opts = {
    window = {
      layout = 'float',
      width = 90,
      height = 30,
      border = 'none',
      row = 5,
      zindex = 100,
    },
    headers = {
      user = '👤 You: ',
      assistant = '🤖 Copilot: ',
      tool = '🔧 Tool: ',
    },
    separator = '━━',
    show_folds = false,
    auto_insert_mode = true,
  },
  config = function(_, opts)
    local copilot_chat = require('CopilotChat')
    copilot_chat.setup(opts)
    vim.keymap.set('n', '<leader>cc', function()
      copilot_chat.toggle()
    end, { desc = 'Toggle CopilotChat', silent = true })
  end,
}
