local M = {}

M.sections = {
	lualine_a = { "filename" },
}

M.filetypes = {
	"dapui_scopes",
	"dapui_stacks",
	"dapui_watches",
	"dapui_breakpoints",
	"dap-repl",
}

return M
