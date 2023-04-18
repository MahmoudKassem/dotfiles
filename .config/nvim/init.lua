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
        import = "plugins"
    },
    {
        'numToStr/Comment.nvim',
        keys = 'gc',
        config = true
    },
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        config = function()
            require('gitsigns').setup({
                current_line_blame_opts = {
                    delay = 0
                },
                preview_config = {
                    border = 'rounded'
                },
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '-' }
                }
            })
        end
    },
    {
        'ggandor/leap.nvim',
        keys = {'s', 'S', 'gs'},
        config = function()
            require('leap').add_default_mappings()
        end
    },
    {
        'kylechui/nvim-surround',
        keys = {'ys', 'cs', 'ds'},
        config = true
    },
    {
        'nvim-tree/nvim-web-devicons',
        lazy = true,
        config = function()
            require('nvim-web-devicons').setup {
                override = {
                    pro = {
                        icon = "",
                        color = "#e37933",
                        name = "Prolog"
                    },
                    mom = {
                        icon = "",
                        color = "#6d8086",
                        name = "Groff_Mom"
                    }
                }
            }
        end
    },
    {
        'nvim-treesitter/playground',
        cmd = 'TSPlaygroundToggle',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        }
    },
    {
        'ahmedkhalf/project.nvim',
        event = 'VeryLazy',
        config = function()
            require("project_nvim").setup({
                show_hidden = true
            })
        end
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
                'gzip',
                'matchit',
                'netrwPlugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin'
            },
        },
    }
})
