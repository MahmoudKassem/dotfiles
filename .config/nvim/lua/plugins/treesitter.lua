return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    ft = {'go', 'haskell', 'lua', 'sh', 'query', 'yaml', 'prolog'},
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {'go', 'haskell', 'lua', 'bash', 'query', 'yaml', 'prolog'},
            highlight = {
                enable = true
            }
        }
    end
}
