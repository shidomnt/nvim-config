require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    'tsserver',
    'jsonls',
    'html',
    'eslint',
    'emmet_ls',
    'cssls',
    'sumneko_lua'
  },
  automatic_installation = true
})
