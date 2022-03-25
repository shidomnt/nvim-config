require("user")

vim.cmd([[
  au! BufRead,BufNewFile *.json set filetype=jsonc
  if has('win32')
  " Enable copying from vim to clipboard
  set clipboard=unnamed  
  else
  set clipboard=unnamedplus
  endif
  if has('wsl')
    let g:clipboard = {
      \   'name': 'win32yank-wsl',
      \   'copy': {
      \      '+': '/bin/win32yank.exe -i --crlf',
      \      '*': '/bin/win32yank.exe -i --crlf',
      \    },
      \   'paste': {
      \      '+': '/bin/win32yank.exe -o --lf',
      \      '*': '/bin/win32yank.exe -o --lf',
      \   },
      \   'cache_enabled': 0,
      \ }
  endif
]])
