return {
    'lewis6991/gitsigns.nvim',
    dependencies = {
        'ahmedkhalf/project.nvim'
    },
    cond = vim.system({'git', 'rev-parse', '--is-inside-work-tree'}):wait().code == 0,
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

        vim.keymap.set('n', '<leader>b', function() vim.cmd.Gitsigns('toggle_current_line_blame') end)
    end
}
