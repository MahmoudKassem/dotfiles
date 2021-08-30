require('cmp').setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' }
  }
}

require('nvim-autopairs').setup {}
require("nvim-autopairs.completion.cmp").setup {
  map_cr = true,
  map_complete = true,
  autoselect = true
}
