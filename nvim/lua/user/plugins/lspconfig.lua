-- setup mason to automatically install lsp servers
require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = true })

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- PHP
require("lspconfig").intelephense.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  capabilities = capabilities,
})

-- Javascript with volar
require("lspconfig").volar.setup({
  capabilities = capabilities,
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
})

require("lspconfig").tailwindcss.setup({ capabilities = capabilities })

--json
require("lspconfig").jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
})

--Emmet
require("lspconfig").emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "blade", "html" },
})

--null-ls for linting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
local lSsources = {
  null_ls.builtins.formatting.blade_formatter,
  null_ls.builtins.formatting.prettier.with({
    filetypes = {
      "javascript",
      "typescript",
      "css",
      "scss",
      "html",
      "json",
      "yaml",
      "markdown",
      "graphql",
      "md",
      "txt",
    },
    only_local = "node_modules/.bin",
  }),
  null_ls.builtins.formatting.stylua.with({
    filetypes = {
      "lua",
    },
    args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
  }),
  null_ls.builtins.diagnostics.stylelint.with({
    filetypes = {
      "css",
      "scss",
    },
  }),
}
require("null-ls").setup({
  sources = lSsources,
})

require("mason-null-ls").setup({ automatic_installation = true })

-- keymaps
vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "F", "<cmd>lua vim.lsp.buf.format()<CR>")
-- for php this feature is only available with intelephense premiumn
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")

vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  },
})

-- Sign config
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
