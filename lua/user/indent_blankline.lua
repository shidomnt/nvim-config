vim.g.indent_blankline_filetype_exclude = { "alpha", "NvimTree" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "help" }
require("indent_blankline").setup({
	-- for example, context is off by default, use this to turn it on
	show_current_context_start = true,
})
