require('nvim-autopairs').setup {}
local cmp = require('cmp')
cmp.setup {
  formatting = {
      format = require('lspkind').cmp_format()
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm()
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'buffer' }
  }
}
