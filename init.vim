
"/__   \_ __ __ _ _ __     /\  /\__ _ 
"  / /\/ '__/ _` | '_ \   / /_/ / _` |
" / /  | | | (_| | | | | / __  / (_| |
" \/   |_|  \__,_|_| |_| \/ /_/ \__,_|
"                                    

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
" set mouse=a 				" Enable mouse
set tabstop=2 				" 
set expandtab
set shiftwidth=2 			" 
set shiftround

set autowrite     " Automatically :write before running commands

"indent
set autoindent
set smartindent
set cindent
filetype plugin indent on

"Fold
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldminlines=100
set listchars=tab:\¦\ 		" Tab charactor
set list

"Number
set number 					" Show line number
set relativenumber

set ignorecase 				" Enable case-sensitive 
set langmenu=en_US.utf8    " sets the language of the menu (gvim)

" Disable backup
set nobackup
set nowb
set noswapfile

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Enable cursor line position tracking:
set cursorline 

set timeoutlen=1000

set ttimeoutlen=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin list
" (used for Vim-plug - https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(stdpath('config').'/plugged')
" Theme
Plug 'joshdick/onedark.vim', 					" Dark theme

" File browser
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

" File System
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Terminal
Plug 'voldikss/vim-floaterm'

" Status bar
Plug 'nvim-lualine/lualine.nvim'

" Code intellisense
Plug 'neovim/nvim-lspconfig' 					" Language Server Protocol
Plug 'hrsh7th/cmp-nvim-lsp'						" Auto Complete
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'quangnguyen30192/cmp-nvim-ultisnips'		"ultisnips for cmp"

Plug 'windwp/nvim-autopairs'            " Auto pairs
Plug 'preservim/nerdcommenter' 					" Comment code 

Plug 'windwp/nvim-ts-autotag'						" Autoclose and autorename html tag

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

"Snippet Plugin
Plug 'SirVer/ultisnips'							"ultisnips

" Snippet
Plug 'epilande/vim-react-snippets'

" Code syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Debugging
Plug 'puremourning/vimspector' 					" Vimspector

" Source code version control 
Plug 'tpope/vim-fugitive' 						" Git
Plug 'rbong/vim-flog'

" Auto-reloading a file in VIM as soon as it changes on disk
Plug 'djoshea/vim-autoread'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Nvim tree
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \}
highlight NvimTreeFolderIcon guibg=blue

" Set theme 
colorscheme onedark
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Settings for Windows

if has('win32')
" Enable copying from vim to clipboard
	set clipboard=unnamed  
  language en
  let g:python3_host_prog = 'C:/Python310/python'
  let g:python_host_prog = 'C:/Python27/python'
else
	set clipboard=unnamedplus
endif

" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
	execute 'source' setting_file
endfor

"Lua config
lua require('config')
