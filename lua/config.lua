require('user.options')
require('user.colorscheme')
require('user.cmp')
require('user.lsp')
require('user.treesitter')
require('user.telescope')
require('user.lualine')
require('user.nvimtree')
require('user.autopairs')
require('user.toggleterm')
require('user.impatient')
require('user.alpha')
require('user.comment')
require('user.project')
require('user.keymaps')
require('user.nvim-colorizer')
require('user.indent_blankline')

-- Settings for Windows
vim.cmd [[
  if has('win32')
  " Enable copying from vim to clipboard
  set clipboard=unnamed  
  language en
  let g:python3_host_prog = 'C:/Python310/python'
  let g:python_host_prog = 'C:/Python27/python'
  else
  set clipboard=unnamedplus
  endif
]]
