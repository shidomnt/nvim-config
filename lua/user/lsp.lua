vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
vim.g.UltiSnipsRemoveSelectModeMappings = 0

local status_navic_ok, navic = pcall(require, "nvim-navic")
if not status_navic_ok then
  return
end

local status_cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_nvim_lsp_ok then
  return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end


local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

local opts = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

local omnisharpOpts = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  cmd = { "dotnet", "/home/shido/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll" },
  enable_import_completion = false,
  enable_editorconfig_support = true,
}

local luaLspOpts = opts
luaLspOpts.settings = {
  Lua = {
    diagnostics = {
      globals = { "vim", "luasnip" },
    },
    workspace = {
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.stdpath("config") .. "/lua"] = true,
      },
    },
  },
}

lspconfig['tsserver'].setup({
  on_attach = function (client, bufnr)
    on_attach(client, bufnr)
    navic.attach(client, bufnr)
  end,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
})
lspconfig['cssls'].setup(opts)
lspconfig['emmet_ls'].setup(opts)
lspconfig['eslint'].setup(opts)
lspconfig['html'].setup(opts)
lspconfig['jsonls'].setup(opts)
lspconfig['omnisharp'].setup(omnisharpOpts)
lspconfig['sumneko_lua'].setup(luaLspOpts)
lspconfig['clangd'].setup(opts)

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  signs = {
    active = signs,
  },
}

vim.diagnostic.config(config)
