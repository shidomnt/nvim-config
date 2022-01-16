require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"css",
		"c_sharp",
		"hjson",
		"html",
		"javascript",
		"json",
		"json5",
		"jsonc",
		"lua",
		"php",
		"python",
		"regex",
		"scss",
		"tsx",
		"typescript",
		"vim",
	}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = {}, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
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
	rainbow = {
		enable = true,
		disable = {}, -- list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})
