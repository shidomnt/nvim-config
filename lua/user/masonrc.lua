local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not status_mason_lsp_ok then
  return
end

mason.setup()
mason_lsp.setup({
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
