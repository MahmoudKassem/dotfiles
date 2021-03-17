require('lualine').setup {
  sections = {
    lualine_a = { {'mode', upper = true} },
    lualine_b = { 'diff', {'branch', icon = ''} },
    lualine_c = { {'filename', file_status = true} },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = { {'filename', file_status = true} },
    lualine_b = {  },
    lualine_c = {  },
    lualine_x = {  },
    lualine_y = {  },
    lualine_z = {  },
  },
}
