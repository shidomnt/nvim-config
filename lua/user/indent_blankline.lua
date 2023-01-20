local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

vim.g.indent_blankline_filetype_exclude = { "alpha", "NvimTree" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "help" }
indent_blankline.setup({
	-- for example, context is off by default, use this to turn it on
	show_current_context_start = true,
})
