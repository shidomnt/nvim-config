require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "css","c_sharp" ,"hjson", "html","javascript","json", "json5", "jsonc", "lua", "php", "python", "regex", "scss","tsx","typescript","vim" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
   autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
