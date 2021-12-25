-------------------------------------------------------------------
-- => Config for Nvim cmp
-------------------------------------------------------------------
-- Setup nvim-cmp.
local cmp = require'cmp'
cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
  -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
end,
},
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
    }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
  -- Accept currently selected item. If none selected, `select` first item.
  -- Set `select` to `false` to only confirm explicitly selected items.
    ['<Cr>'] = cmp.mapping.confirm({ select = false }),
  },
sources = cmp.config.sources({
{ name = 'nvim_lsp' },
-- { name = 'vsnip' }, -- For vsnip users.
{ name = 'ultisnips' }, -- For ultisnips users.
-- { name = 'luasnip' }, -- For luasnip users.
-- { name = 'snippy' }, -- For snippy users.
}, {
{ name = 'buffer' },
})
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
      }
    })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
    { name = 'path' }
    }, {
    { name = 'cmdline' }
    })
  })

  -- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
---------------------------------------------------------------------
-- => Config for Lsp config
---------------------------------------------------------------------
  local nvim_lsp = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  local servers = {'emmet_ls', 'jsonls', 'tsserver', 'cssls', 'html', 'clangd' }

  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
        flags = {
        debounce_text_changes = 150,
      }
    }
  end
-------------------------------------------------------------------
-- => Config for Tree sitter
-------------------------------------------------------------------

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)

require'nvim-treesitter.configs'.setup {
ensure_installed = { "c", "cpp", "css","c_sharp" ,"hjson", "html","javascript","json", "json5", "jsonc", "lua", "php", "python", "regex", "scss","tsx","typescript","vim" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
	autotag = {
    enable = true,
  },
}

-------------------------------------------------------------------
-- => Config for Telescope
-------------------------------------------------------------------

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
	  find_files = {
      theme = "dropdown",
    },
	  live_grep = {
      theme = "dropdown",
    }
  },
}


-------------------------------------------------------------------
-- => Config for Lualine
-------------------------------------------------------------------
require'lualine'.setup {
  sections = {
    lualine_b = {
      {
        'filename',
        path = 1,
      }
    },
    lualine_c = {'branch', 'diff', 'diagnostics'},
    lualine_x = {'encoding','fileformat' ,'filetype'},
    lualine_z = {'location'},
  },
  tabline = {
    lualine_a = {},
    lualine_b = {'buffers'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        'tabs',
        mode = 2,
      }
    },
  },
  extensions = {
    'nvim-tree'
  }
}

-------------------------------------------------------------------
-- => Config for nvim tree
-------------------------------------------------------------------
require'nvim-tree'.setup {
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  view = {
    auto_resize = true,
  },
}

-------------------------------------------------------------------
-- => Config for nvim autopairs
-------------------------------------------------------------------
require('nvim-autopairs').setup{}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

