require("user")

-- Settings for Windows
vim.cmd([[
  if has('win32')
  " Enable copying from vim to clipboard
  set clipboard=unnamed  
  language en
  let g:python3_host_prog = 'C:/Python310/python'
  let g:python_host_prog = 'C:/Python27/python'
  else
  set clipboard=unnamedplus
  endif
]])
