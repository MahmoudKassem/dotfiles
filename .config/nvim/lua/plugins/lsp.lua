return {
    'neovim/nvim-lspconfig',
    build = ':MasonUpdate',
    cmd = 'Mason',
    dependencies = {
        'williamboman/mason.nvim',
        'hrsh7th/cmp-nvim-lsp'
    },
    ft = { 'go', 'haskell', 'prolog', 'lua' },
    keys = { { '<leader>M', function() vim.cmd.Mason() end } },
    config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        local on_attach = function()
            local function keymapSet(mode, keyCombination, action)
                vim.keymap.set(mode, keyCombination, action)
            end
            keymapSet('n', '<leader>a', vim.lsp.buf.code_action)
            keymapSet('n', '<leader>d', function() vim.cmd.Telescope('lsp_definitions') end)
            keymapSet('n', '<leader>F', vim.lsp.buf.format)
            keymapSet('n', '<leader>i', function() vim.cmd.Telescope({ 'diagnostics', 'bufnr=0' }) end)
            keymapSet('n', '<leader>m', vim.diagnostic.open_float)
            keymapSet('n', '<leader>r', vim.lsp.buf.rename)
            keymapSet('n', '<leader>o', function() vim.cmd.Telescope('lsp_references') end)
            keymapSet('n', '<leader>v', vim.lsp.buf.hover)
        end

        vim.diagnostic.config({
            signs = false,
            underline = true,
            update_in_insert = true,
            virtual_text = {
                spacing = 2,
                prefix = ''
            }
        })

        vim.lsp.config.gopls = {
            capabilities = capabilities,
            on_attach = on_attach
        }

        vim.lsp.config.hls = {
            capabilities = capabilities,
            on_attach = on_attach
        }

        vim.lsp.config.lua_ls = {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                        path = vim.split(package.path, ';'),
                    },
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                        },
                    },
                    telemetry = {
                        enable = false
                    }
                }
            }
        }

        vim.lsp.config.prolog_ls = {
            cmd = { 'swipl',
                '-g', 'use_module(library(lsp_server))',
                '-g', 'lsp_server:main',
                '-t', 'halt',
                '--', 'stdio' },
            root_markers = { '.git', 'pack.pl' },
            filetypes = { 'prolog' },
            capabilities = capabilities,
            on_attach = function(client)
                client.server_capabilities.semanticTokensProvider = nil
                on_attach()
            end
        }

        vim.lsp.enable({'gopls', 'hls', 'lua_ls', 'prolog_ls'})

        require('mason').setup({
            ui = {
                border = 'rounded',
                height = 0.8,
                width = 0.8
            }
        })
    end
}
