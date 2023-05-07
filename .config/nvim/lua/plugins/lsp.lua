return {
    'neovim/nvim-lspconfig',
    build = ':MasonUpdate',
    cmd = 'Mason',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'ahmedkhalf/project.nvim'
    },
    ft = {'go', 'haskell', 'prolog', 'lua'},
    keys = {{'<leader>M', function() vim.cmd.Mason() end}},
    config = function()
        local lsp_config = require('lspconfig')
        local servers = {
            gopls = {},
            hls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                            path = vim.split(package.path, ';'),
                        },
                        diagnostics = {
                            globals = {'vim'},
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
        }

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        local on_attach = function()
            local function keymapSet(mode, keyCombination, action)
                vim.keymap.set(mode, keyCombination, action)
            end
            keymapSet('n', '<leader>a', vim.lsp.buf.code_action)
            keymapSet('n', '<leader>d', function() vim.cmd.Telescope('lsp_definitions') end)
            keymapSet('n', '<leader>F', vim.lsp.buf.format)
            keymapSet('n', '<leader>i', function() vim.cmd.Telescope({'diagnostics', 'bufnr=0'}) end)
            keymapSet('n', '<leader>m', function() vim.diagnostic.open_float({border = "rounded"}) end)
            keymapSet('n', '<leader>r', vim.lsp.buf.rename)
            keymapSet('n', '<leader>o', function() vim.cmd.Telescope('lsp_references') end)
            keymapSet('n', '<leader>v', vim.lsp.buf.hover)
        end

        require('mason').setup({
            ui = {
                border = 'rounded',
                height = 0.8,
                width = 0.8
            }
        })

        local mason_lspconfig = require('mason-lspconfig')
        mason_lspconfig.setup {
            ensure_installed = vim.tbl_keys(servers)
        }

        mason_lspconfig.setup_handlers {
            function(server_name)
                lsp_config[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name].settings
                }
            end
        }

        lsp_config.prolog_ls.setup {
            capabilities = capabilities,
            on_attach = function(client)
                client.server_capabilities.semanticTokensProvider = nil
                on_attach()
            end
        }

        vim.cmd.doautocmd('FileType')

        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                signs = false,
                underline = true,
                update_in_insert = true,
                virtual_text = {
                    spacing = 2,
                    prefix = ''
                },
            }
        )

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover,
            {
                border = "rounded"
            }
        )

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help,
            {
                border = "rounded"
            }
        )
    end
}
