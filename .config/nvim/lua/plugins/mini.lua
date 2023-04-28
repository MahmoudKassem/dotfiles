return {
    {
        'echasnovski/mini.comment',
        keys = 'gc',
        config = function ()
            require('mini.comment').setup()
        end
    },
    {
        'echasnovski/mini.jump',
        keys = {'f', 'F', 't', 'T'},
        config = function ()
            require('mini.jump').setup()
        end
    },
    {
        'echasnovski/mini.move',
        keys = {'<leader>H', '<leader>L', '<leader>J', '<leader>K'},
        config = function ()
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
        end
    },
    {
        'echasnovski/mini.pairs',
        event = 'InsertEnter',
        config = function ()
            require('mini.pairs').setup()
        end
    },
    {
        'echasnovski/mini.surround',
        keys = {'ys', 'ds', 'cs'},
        config = function ()
            require('mini.surround').setup({
                mappings = {
                    add = 'as',
                    delete = 'ds',
                    replace = 'cs',
                    find = nil,
                    find_left = nil,
                    highlight = nil,
                    update_n_lines = nil
                }
            })
        end
    }
}
