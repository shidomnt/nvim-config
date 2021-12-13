
"/__   \_ __ __ _ _ __     /\  /\__ _ 
"  / /\/ '__/ _` | '_ \   / /_/ / _` |
" / /  | | | (_| | | | | / __  / (_| |
" \/   |_|  \__,_|_| |_| \/ /_/ \__,_|
"                                    

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a 				" Enable mouse
set tabstop=4 				" 
set shiftwidth=4 			" 
set foldmethod=indent 		" 
set listchars=tab:\¦\ 		" Tab charactor 
set list
set foldlevelstart=99 		"  
set number 					" Show line number
set ignorecase 				" Enable case-sensitive 

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
Plug 'junegunn/fzf', 
			\ { 'do': { -> fzf#install() } } 			" Fuzzy finder 
Plug 'junegunn/fzf.vim'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'

" Terminal
Plug 'voldikss/vim-floaterm' 					" Float terminal

" Code intellisense
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'ray-x/lsp_signature.nvim'

Plug 'jiangmiao/auto-pairs' 					" Parenthesis auto 
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim' 
Plug 'preservim/nerdcommenter' 					" Comment code 
Plug 'alvan/vim-closetag' 						" Auto close HTML/XML tag 

"Snippet Plugin
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Code syntax highlight
Plug 'yuezk/vim-js' 							" Javascript
Plug 'MaxMEllon/vim-jsx-pretty' 				" JSX/React
Plug 'jackguo380/vim-lsp-cxx-highlight'			" C++ syntax
Plug 'uiiaoo/java-syntax.vim' 					" Java

" Debugging
Plug 'puremourning/vimspector' 					" Vimspector

" Source code version control 
Plug 'tpope/vim-fugitive' 						" Git

" Auto-reloading a file in VIM as soon as it changes on disk
Plug 'djoshea/vim-autoread'

" Live Reload Server for html/css/js
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
" Github Copilot
Plug 'github/copilot.vim'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set theme 
colorscheme onedark

" Overwrite some color highlight 
if (has("autocmd"))
	augroup colorextend
		autocmd ColorScheme 
					\ * call onedark#extend_highlight("Comment",{"fg": {"gui": "#728083"}})
		autocmd ColorScheme 
					\ * call onedark#extend_highlight("LineNr", {"fg": {"gui": "#728083"}})
	augroup END
endif

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
	execute 'source' setting_file
endfor

"Lua config
lua require('config')


