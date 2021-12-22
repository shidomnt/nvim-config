
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
set foldmethod=indent 		" 
set foldlevelstart=99
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

" Enable copying from vim to clipboard
if has('win32')
	set clipboard=unnamed  
else
	set clipboard=unnamedplus
endif

" Enable cursor line position tracking:
set cursorline 

set timeoutlen=1000

set ttimeoutlen=0

" function! CloseHiddenBuffers()
"     " >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"     " close any buffers hidden
"     " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
"     let open_buffers = []
"
"     for i in range(tabpagenr('$'))
"         call extend(open_buffers, tabpagebuflist(i + 1))
"     endfor
"
"     for num in range(1, bufnr("$") + 1)
"         if buflisted(num) && index(open_buffers, num) == -1
"             exec "bdelete ".num
"         endif
"     endfor
" endfunction
"
" au BufEnter * call CloseHiddenBuffers()

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

" File System
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-eunuch'

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

Plug 'quangnguyen30192/cmp-nvim-ultisnips'		"ultisnips for cmp"

Plug 'jiangmiao/auto-pairs' 					" Parenthesis auto 
Plug 'preservim/nerdcommenter' 					" Comment code 

Plug 'windwp/nvim-ts-autotag'						" Autoclose and autorename html tag

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

"Format Code
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

"Snippet Plugin
Plug 'SirVer/ultisnips'							"ultisnips

" Snippet
Plug 'epilande/vim-react-snippets'

" Code syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'

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

"Nvim cmp
set completeopt=menu,menuone,noselect

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

if(has('win32'))
  language en
  let g:python3_host_prog = 'C:/Python310/python'
  let g:python_host_prog = 'C:/Python27/python'
endif

" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
	execute 'source' setting_file
endfor

"Lua config
lua require('config')
