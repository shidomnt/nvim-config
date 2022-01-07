require("telescope").setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		mappings = {
			i = {
				["<C-h>"] = "which_key",
			},
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
	},
})
