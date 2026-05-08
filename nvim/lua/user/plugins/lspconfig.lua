return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
  },
  config = function()
    require('mason').setup({
      ui = {
        height = 0.8,
      },
    })
    require('mason-lspconfig').setup({ automatic_installation = true })

    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

    vim.lsp.config('intelephense', {
      on_attach = function(client, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, 'IntelephenseIndex', function()
          vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
        end, {})
      end,
      capabilities = capabilities,
    })

    vim.lsp.config('volar', {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
    })

    vim.lsp.config('ts_ls', {
      capabilities = capabilities,
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = '/usr/local/lib/node_modules/@vue/typescript-plugin',
            languages = { 'javascript', 'typescript', 'vue' },
          },
        },
      },
      filetypes = {
        'javascript', 'javascriptreact', 'javascript.jsx',
        'typescript', 'typescriptreact', 'typescript.tsx', 'vue',
      },
    })

    vim.lsp.config('tailwindcss', { capabilities = capabilities })

    vim.lsp.config('jsonls', {
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
        },
      },
    })


    vim.lsp.config('gdscript', { capabilities = capabilities })

    vim.lsp.enable({
      'intelephense',
      'volar',
      'ts_ls',
      'tailwindcss',
      'jsonls',
      'lua_ls',
      'gdscript',
    })


    -- Keymaps
    vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
    vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>')
    vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
    vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
    vim.keymap.set('n', '<Leader>lr', ':LspRestart<CR>', { silent = true })
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

    -- Diagnostics
    vim.diagnostic.config({
      virtual_text = false,
      float = {
        source = true,
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN]  = '',
          [vim.diagnostic.severity.INFO]  = '',
          [vim.diagnostic.severity.HINT]  = '',
        },
      },
    })
  end,
}
