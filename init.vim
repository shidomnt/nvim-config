
"/__   \_ __ __ _ _ __     /\  /\__ _ 
"  / /\/ '__/ _` | '_ \   / /_/ / _` |
" / /  | | | (_| | | | | / __  / (_| |
" \/   |_|  \__,_|_| |_| \/ /_/ \__,_|
"                                    

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set mouse=a 				" Enable mouse
set tabstop=2 				" 
set shiftwidth=2 			" 
set autoindent
set smartindent
set foldmethod=indent 		" 
" set listchars=tab:\¦\ 		" Tab charactor 
" set list
set foldlevelstart=99
set number 					" Show line number
set ignorecase 				" Enable case-sensitive 
set langmenu=en_US.utf8    " sets the language of the menu (gvim)

" Disable backup
set nobackup
set nowb
set noswapfile

syntax on

" Enable copying from vim to clipboard
if has('win32')
	set clipboard=unnamed  
else
	set clipboard=unnamedplus
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin list
" (used for Vim-plug - https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(stdpath('config').'/plugged')
" Theme
Plug 'joshdick/onedark.vim', 					" Dark theme

" File browser
Plug 'preservim/nerdTree' 						" File browser  
Plug 'Xuyuanp/nerdtree-git-plugin' 				" Git status
Plug 'ryanoasis/vim-devicons' 					" Icon
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'unkiwii/vim-nerdtree-sync' 				" Sync current file 

" File search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'

" Terminal
Plug 'voldikss/vim-floaterm' 					" Float terminal

" Code intellisense
Plug 'neovim/nvim-lspconfig' 					" Language Server Protocol
Plug 'hrsh7th/cmp-nvim-lsp'						" Auto Complete
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'ray-x/lsp_signature.nvim'					"Hint

" Plug 'hrsh7th/cmp-vsnip'						"vsnip for cmp"
" Plug 'saadparwaiz1/cmp_luasnip'				"luasnip for cmp"
Plug 'quangnguyen30192/cmp-nvim-ultisnips'		"ultisnips for cmp"

Plug 'jiangmiao/auto-pairs' 					" Parenthesis auto 
Plug 'mattn/emmet-vim' 
Plug 'preservim/nerdcommenter' 					" Comment code 

Plug 'windwp/nvim-ts-autotag'						" Autoclose and autorename html tag

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

"Format Code
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

"Snippet Plugin
" Plug 'hrsh7th/vim-vsnip'						"vsnip
" Plug 'hrsh7th/vim-vsnip-integ'				"vsnip
" Plug 'L3MON4D3/LuaSnip'						"LuaSnip
Plug 'SirVer/ultisnips'							"ultisnips

" Snippet
Plug 'epilande/vim-react-snippets'

" Code syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-refactor'

" Debugging
Plug 'puremourning/vimspector' 					" Vimspector

" Source code version control 
Plug 'tpope/vim-fugitive' 						" Git
Plug 'rbong/vim-flog'

" Auto-reloading a file in VIM as soon as it changes on disk
Plug 'djoshea/vim-autoread'

" Github Copilot
Plug 'github/copilot.vim'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set theme 
colorscheme onedark

" Overwrite some color highlight 
" if (has("autocmd"))
"   augroup colorextend
"     autocmd ColorScheme
"           \ * call onedark#extend_highlight("Comment",{"fg": {"gui": "#728083"}})
"     autocmd ColorScheme
"           \ * call onedark#extend_highlight("LineNr", {"fg": {"gui": "#728083"}})
"   augroup END
" endif

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Settings for Windows

"if(has('win32'))
"	let g:python3_host_prog = 'C:/Python310/python'
"	let g:python_host_prog = 'C:/Python27/python'
"endif

" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
	execute 'source' setting_file
endfor

"Lua config
lua require('config')


