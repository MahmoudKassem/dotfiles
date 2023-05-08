return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    ft = {'go', 'haskell', 'lua', 'sh', 'query', 'yaml'},
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {'go', 'haskell', 'lua', 'bash', 'query', 'yaml'},
            highlight = {
                enable = true
            }
        }
    end
}
