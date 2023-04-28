return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        local file = {
            'filename',
            file_status = true
        }

        local lspDiagnostics = {
            'diagnostics',
            sources = {
                'nvim_diagnostic'
            },
            sections = ({
                'error',
                'warn',
                'hint',
                'info'
            }),
            update_in_insert = true
        }

        require('lualine').setup {
            sections = {
                lualine_a = {
                    {
                        'mode',
                        upper = true
                    }
                },
                lualine_b = {
                    'branch',
                    'diff'
                },
                lualine_c = {
                    lspDiagnostics,
                    file
                },
                lualine_x = {
                    {
                        'filetype',
                        colored = false
                    },
                    'fileformat',
                    'encoding',
                    'location'
                },
                lualine_y = {},
                lualine_z = {
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates
                    }
                }
            },
            inactive_sections = {
                lualine_a = {
                    'diff',
                    lspDiagnostics,
                    file
                },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {
                lualine_a = {
                    {
                        'tabs',
                        mode = 1,
                        fmt = function(name, context)
                            local buflist = vim.fn.tabpagebuflist(context.tabnr)
                            local winnr = vim.fn.tabpagewinnr(context.tabnr)
                            local bufnr = buflist[winnr]
                            local mod = vim.fn.getbufvar(bufnr, '&mod')
                            return name .. (mod == 1 and ' +' or '')
                        end
                    }
                },
                lualine_b = {'windows'},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            }
        }

        vim.opt.showtabline = 1
    end
}
