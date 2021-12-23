-------------------------------------------------------------------
-- => Config for lsp_signature
-------------------------------------------------------------------

cfg = {
	floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

	floating_window_above_cur_line = false, -- try to place the floating above the current line when possible Note:
	-- will set to true when fully tested, set to false will use whichever side has more space
	-- this setting will be helpful if you do not want the PUM and floating win overlap
	fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
	hint_enable = false, -- virtual hint enable
	hint_prefix = "🐼 ",  -- Panda for parameter
	hint_scheme = "String",
	auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58
	transparency = nil, -- disabled by default, allow floating win transparent value 1~100
   max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
                   -- to view the hiding contents
  max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
	timer_interval = 1000, -- default timer check interval set to lower value if you want to reduce latency
	toggle_key = '<M-e>', -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
  handler_opts = {
    border = "rounded"   -- double, rounded, single, shadow, none
  },
	}

-- recommanded:
require'lsp_signature'.setup(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key

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
		['<Cr>'] = cmp.mapping.confirm({ select = true }),
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

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['tsserver'].setup {
	  capabilities = capabilities
	  }
  require('lspconfig')['clangd'].setup {
	  capabilities = capabilities
	  }
  require('lspconfig')['html'].setup {
	  capabilities = capabilities
	  }
  require('lspconfig')['cssls'].setup {
	  capabilities = capabilities
	  }
  require('lspconfig')['jsonls'].setup {
      capabilities = capabilities
      }
  require('lspconfig')['emmet_ls'].setup {
	  capabilities = capabilities
    };    

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
	refactor = {
    highlight_current_scope = { enable = false },
		smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
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
-- => Config for Lualine / Tabline
-------------------------------------------------------------------require'tabline'.setup {enable = false}
require'lualine'.setup {
  sections = {
    lualine_b = {
      {
        'filename',
        path = 1,
      }
    },
    lualine_c = {'branch', 'diff'},
    lualine_x = {'encoding','fileformat' ,'filetype'},
    lualine_z = {'location', 'diagnostics'},
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
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
require'nvim-tree'.setup {}

-------------------------------------------------------------------
-- => Config for nvim autopairs
-------------------------------------------------------------------
require('nvim-autopairs').setup{}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

