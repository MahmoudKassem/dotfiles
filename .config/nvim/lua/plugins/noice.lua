return {
    'folke/noice.nvim',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify'
    },
    event = 'VeryLazy',
    config = function ()
        require('notify').setup({
            background_colour = '#1d2021',
            render = 'compact',
            stages = 'static'
        })

        require('noice').setup({
            format = {
                spinner = {
                    name = 'bouncingBar'
                }
            },
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true
                }
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                lsp_doc_border = true
            },
            routes = {
                {
                    filter = { event = 'lsp', kind = 'progress', find = 'Processing hls' },
                    opts = { skip = true },
                },
                {
                    view = 'notify',
                    filter = { event = 'msg_showmode' },
                }
            },
            views = {
                mini = {
                    border = 'rounded',
                    position = {
                        row = -2
                    },
                    win_options = {
                        winblend = 0
                    }
                },
                split = {
                    enter = true
                }
            }
        })
    end
}
