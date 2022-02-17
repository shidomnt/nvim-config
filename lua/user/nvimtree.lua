vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_git_hl = 1
vim.highlight.NvimTreeFolderIcon = "guibg=blue"
vim.g.nvim_tree_respect_buf_cwd = 1
require("nvim-tree").setup({
  disable_netrw = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
  diagnostics = {
    enable = true,
  },
	view = {
		auto_resize = true,
	},
})
