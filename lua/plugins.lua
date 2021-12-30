local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
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
--use 'voldikss/vim-floaterm'
use {"akinsho/toggleterm.nvim"}
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
use {
  'ray-x/lsp_signature.nvim',
}
use 'onsails/lspkind-nvim'
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
use {
    'SirVer/ultisnips',
    requires = {{'honza/vim-snippets', rtp = '.'}},
    config = function()
      vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
      vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
      vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
      vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
      vim.g.UltiSnipsRemoveSelectModeMappings = 0
    end
}							--ultisnips
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

if packer_bootstrap then
    require('packer').sync()
end
end)
