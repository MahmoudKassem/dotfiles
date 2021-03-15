require('lualine').status {
  sections = {
    lualine_a = { {'mode', upper = true} },
    lualine_b = { {'branch', icon = ''}, 'diff' },
    lualine_c = { {'filename', file_status = true} },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location'  },
  },
  inactive_sections = {
    lualine_a = { {'branch', icon = ''}, 'diff' },
    lualine_b = { {'filename', file_status = true} },
    lualine_c = {  },
    lualine_x = {  },
    lualine_y = {  },
    lualine_z = {  },
  },
}
