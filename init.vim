"/__   \_ __ __ _ _ __     /\  /\__ _ 
"  / /\/ '__/ _` | '_ \   / /_/ / _` |
" / /  | | | (_| | | | | / __  / (_| |
" \/   |_|  \__,_|_| |_| \/ /_/ \__,_|
"                                    

syntax on
set listchars=tab:\¦\
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('plugins')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nvim tree
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_git_hl = 1
highlight NvimTreeFolderIcon guibg=blue

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
