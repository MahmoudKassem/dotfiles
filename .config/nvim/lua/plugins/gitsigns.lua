return {
    'lewis6991/gitsigns.nvim',
    dependencies = {
        'ahmedkhalf/project.nvim'
    },
    cond = function(_)
        vim.fn.system('git rev-parse HEAD')
        return vim.v.shell_error == 0
    end,
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
