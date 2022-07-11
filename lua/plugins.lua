local fn = vim.fn
-- -- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	Packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- -- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function(use)
	-- -- Manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")

	-- -- Theme
	use("joshdick/onedark.vim")

	-- -- Icons
	use("kyazdani42/nvim-web-devicons")

	-- -- File browser
	use("kyazdani42/nvim-tree.lua")

	-- -- File System
	use("nvim-telescope/telescope.nvim")
	use("ahmedkhalf/project.nvim")

	-- -- Terminal
	use({ "akinsho/toggleterm.nvim" })

	-- -- Status bar
	use("nvim-lualine/lualine.nvim")
	use("kdheepak/tabline.nvim")
	use({
		"SmiteshP/nvim-gps",
		config = function()
			require("nvim-gps").setup()
		end,
	})

	-- -- Code intellisense
	use("neovim/nvim-lspconfig") -- Language Server Protocol
	use("williamboman/nvim-lsp-installer")
	use("hrsh7th/cmp-nvim-lsp") -- Auto Complete
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("ray-x/lsp_signature.nvim")
	use("onsails/lspkind-nvim")
	use("windwp/nvim-autopairs") -- Auto pairs
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("windwp/nvim-ts-autotag") -- Autoclose and autorename html tag
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- -- . command
	use("tpope/vim-repeat")

	-- -- surround
	use({ "tpope/vim-surround" })

	-- -- Indent
	use("lukas-reineke/indent-blankline.nvim")

	-- -- Snippet
	-- use("quangnguyen30192/cmp-nvim-ultisnips")
	-- use({
	-- 	"SirVer/ultisnips",
	-- 	requires = { { "honza/vim-snippets", rtp = "." } },
	-- 	config = function()
	-- 		vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
	-- 		vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
	-- 		vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
	-- 		vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
	-- 		vim.g.UltiSnipsRemoveSelectModeMappings = 0
	-- 	  end
	-- })
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'rafamadriz/friendly-snippets' }

	-- -- Code syntax highlight
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")

	-- -- Debugging
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")

	-- -- Source code version control
	use("tpope/vim-fugitive") -- Git
	use("rbong/vim-flog")
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- -- Auto-reloading a file in VIM as soon as it changes on disk
	use("djoshea/vim-autoread")

	-- -- Improve startup time
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient").enable_profile()
		end,
	})

	-- -- Dashboard
	use("goolord/alpha-nvim")

	-- -- Color highlighter for html/css/js
	use("norcalli/nvim-colorizer.lua")

	if Packer_bootstrap then
		require("packer").sync()
	end
end)
