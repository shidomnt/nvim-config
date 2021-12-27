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

set listchars=tab:\¦\ 		" Tab charactor
set list

"Number
set number 					" Show line number
set relativenumber

set ignorecase 				" Enable case-sensitive 

" Disable backup
set nobackup
set nowb
set noswapfile

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Enable cursor line position tracking:
set cursorline 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('plugins')

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

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
let g:nvim_tree_icons = {
      \ 'default': '',
      \ 'symlink': '',
      \ 'git': {
        \   'unstaged': "✗",
        \   'staged': "✓",
        \   'unmerged': "",
        \   'renamed': "➜",
        \   'untracked': "★",
        \   'deleted': "",
        \   'ignored': "◌"
        \   },
        \ 'folder': {
          \   'arrow_open': "",
          \   'arrow_closed': "",
          \   'default': "",
          \   'open': "",
          \   'empty': "",
          \   'empty_open': "",
          \   'symlink': "",
          \   'symlink_open': "",
          \   }
          \ }
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

"Other Lua config
lua require('config')
