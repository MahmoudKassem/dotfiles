require('autocommands')
require('colors')
require('filetype')
require('keymap')
require('options')
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
    {
        import = 'plugins'
    }
},
{
    ui = {
        border = 'rounded'
    },
    checker = {
        enabled = true
    },
    performance = {
        rtp = {
            disabled_plugins = {
                'editorconfig',
                'gzip',
                'health',
                'man',
                'matchit',
                'matchparen',
                'netrwPlugin',
                'nvim',
                'rplugin',
                'shada',
                'spellfile',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin'
            },
        },
    }
})

vim.keymap.set('n', '<leader>z', function() vim.cmd.Lazy() end)
