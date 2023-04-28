return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        ft = {'go', 'haskell', 'lua', 'sh', 'query', 'yaml'},
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {'go', 'haskell', 'lua', 'bash', 'query', 'yaml'},
                highlight = {
                    enable = true
                },
                query_linter = {
                    enable = true,
                    use_virtual_text = true,
                    lint_events = {'BufWrite', 'CursorHold'},
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
    }
}
