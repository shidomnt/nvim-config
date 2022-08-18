require("user.lualine.tabline")
-- Custom Extensions
local dapui = require("user.lualine.extensions.dapui")
local navic = require("nvim-navic")

local diff = {
	"diff",
	colored = false, -- Displays a colored diff status if set to true
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
}

local location = function()
	return "%2l/%L:%-2v"
end

local tab = {
	"tabs",
	mode = 2, -- 0: Shows tab_nr
	-- 1: Shows tab_name
	-- 2: Shows tab_nr + tab_name
}

local filename = {
	"filename",
	file_status = true, -- Displays file status (readonly status, modified status)
	path = 0, -- 0: Just the filename
	-- 1: Relative path
	-- 2: Absolute path

	shorting_target = 40, -- Shortens path to leave 40 spaces in the window
	-- for other components. (terrible name, any suggestions?)
	symbols = {
		modified = "[+]", -- Text to show when the file is modified.
		readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
		unnamed = "[No Name]", -- Text to show for unnamed buffers.
	},
}

local buffers = {
	"buffers",
	show_filename_only = true, -- Shows shortened relative path when set to false.
	show_modified_status = true, -- Shows indicator when the buffer is modified.

	mode = 2, -- 0: Shows buffer name
	-- 1: Shows buffer index (bufnr)
	-- 2: Shows buffer name + buffer index (bufnr)
}

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
		lualine_b = { "branch", diff, "diagnostics" },
		lualine_c = { filename, { navic.get_location, cond = navic.is_available } },
		lualine_x = { "encoding", "fileformat" },
		lualine_y = { "filetype" },
		lualine_z = { location },
	},
	tabline = {
		-- lualine_a = {},
		-- lualine_b = { buffers },
		-- lualine_c = { require("tabline").tabline_buffers },
		-- lualine_x = { require("tabline").tabline_tabs },
		-- lualine_y = {},
		-- lualine_z = { tab },
	},
	extensions = {
		dapui,
		"nvim-tree",
		"quickfix",
		"toggleterm",
	},
})
