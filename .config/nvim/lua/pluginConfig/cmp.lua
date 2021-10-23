require('cmp').setup {
  formatting = {
      format = require('lspkind').cmp_format()
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'buffer' }
  }
}
