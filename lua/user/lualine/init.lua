-- Custom Extensions
local dapui = require("user.lualine.extensions.dapui")

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{
				"filename",
				path = 1,
			},
		},
		lualine_c = { "branch", "diff", "diagnostics" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	tabline = {
		lualine_a = {},
		lualine_b = { "buffers" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {
			{
				"tabs",
				mode = 2,
			},
		},
	},
	extensions = {
		dapui,
		"nvim-tree",
		"quickfix",
		"toggleterm",
	},
})
