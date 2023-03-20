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
