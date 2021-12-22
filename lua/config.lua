-------------------------------------------------------------------
-- => Config for lsp_signature
-------------------------------------------------------------------

cfg = {
	floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

	floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
	-- will set to true when fully tested, set to false will use whichever side has more space
	-- this setting will be helpful if you do not want the PUM and floating win overlap
	fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
	hint_enable = false, -- virtual hint enable
	hint_prefix = "🐼 ",  -- Panda for parameter
	hint_scheme = "String",
	auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
	extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
	transparency = 60, -- disabled by default, allow floating win transparent value 1~100
	timer_interval = 1000, -- default timer check interval set to lower value if you want to reduce latency
	toggle_key = '<M-e>' -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
	}

-- recommanded:
require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

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

local filetypes = {
  'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue'}
local skip_tags = {
  'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
  'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem'
}

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
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
	find_files = {
      theme = "dropdown",
    },
	live_grep = {
      theme = "dropdown",
    }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

