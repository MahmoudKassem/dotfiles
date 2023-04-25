return {
    'echasnovski/mini.nvim',
    event = 'VeryLazy',
    config = function ()
        require('mini.comment').setup()
        require('mini.move').setup({
            mappings = {
                left = '<leader>H',
                right = '<leader>L',
                down = '<leader>J',
                up = '<leader>K',
                line_left = '<leader>H',
                line_right = '<leader>L',
                line_down = '<leader>J',
                line_up = '<leader>K'
            }
        })
        require('mini.pairs').setup()
        require('mini.surround').setup({
            mappings = {
                add = 'as',
                delete = 'ds',
                find = nil,
                find_left = nil,
                highlight = nil,
                replace = 'cs',
                update_n_lines = nil
            }
        })
    end
}
