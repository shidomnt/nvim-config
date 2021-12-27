vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
use 'wbthomason/packer.nvim'

-- -- Theme
use 'joshdick/onedark.vim' 					-- Dark theme
--
-- -- File browser
use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
}
--
-- -- File System
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}
--
-- -- Terminal
use 'voldikss/vim-floaterm'
--
-- -- Status bar
use {
  'nvim-lualine/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
}
--
-- -- Code intellisense
use 'neovim/nvim-lspconfig' 					-- Language Server Protocol
use 'williamboman/nvim-lsp-installer'
use 'hrsh7th/cmp-nvim-lsp'						-- Auto Complete
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
use 'quangnguyen30192/cmp-nvim-ultisnips'		--ultisnips for cmp--
--
use 'windwp/nvim-autopairs'            -- Auto pairs
use 'preservim/nerdcommenter' 					-- Comment code
--
use 'windwp/nvim-ts-autotag'						-- Autoclose and autorename html tag
--
-- -- . command
use 'tpope/vim-repeat'
--
use 'tpope/vim-surround'
--
-- --Snippet
use 'SirVer/ultisnips'							--ultisnips
use 'epilande/vim-react-snippets'
--
-- -- Code syntax highlight
use  'nvim-treesitter/nvim-treesitter'
--
-- -- Debugging
use 'puremourning/vimspector' 					-- Vimspector
--
-- -- Source code version control
use 'tpope/vim-fugitive' 						-- Git
use 'rbong/vim-flog'
--
-- -- Auto-reloading a file in VIM as soon as it changes on disk
use 'djoshea/vim-autoread'

end)
