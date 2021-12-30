require'lualine'.setup {
  sections = {
    lualine_b = {
      {
        'filename',
        path = 1,
      }
    },
    lualine_c = {'branch', 'diff', 'diagnostics'},
    lualine_x = {'encoding','fileformat' ,'filetype'},
    lualine_z = {'location'},
  },
  tabline = {
    lualine_a = {},
    lualine_b = {'buffers'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        'tabs',
        mode = 2,
      }
    },
  },
  extensions = {
    'nvim-tree'
  }
}

