local options = {
	tabstop = 2,
	expandtab = true,
	shiftwidth = 2,
	shiftround = true,
	autowrite = true,
	autoindent = true,
	smartcase = true,
	fileencoding = "utf-8",
	smartindent = true,
	cindent = true,
	timeoutlen = 1000,
	undofile = true,
	writebackup = false,
	showmode = false,
	completeopt = { "menuone", "noselect" },
	clipboard = "unnamedplus",
	number = true,
	relativenumber = true,
	ignorecase = true,
	termguicolors = true,
	backup = false,
	swapfile = false,
	splitbelow = true,
	splitright = true,
	cursorline = true,
	scrolloff = 8,
	sidescrolloff = 8,
	numberwidth = 2, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set wildignore+=*/node_modules/*")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])
