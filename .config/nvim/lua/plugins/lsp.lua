return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp'
    },
    ft = {'go', 'haskell', 'prolog', 'lua'},
    config = function()
        local lsp_config = require('lspconfig')
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        lsp_config.prolog_ls.setup {
            on_attach = function (client)
                client.server_capabilities.semanticTokensProvider = nil
            end,
            capabilities = capabilities,
        }

        lsp_config.gopls.setup {
            capabilities = capabilities
        }

        lsp_config.hls.setup {
            capabilities = capabilities
        }

        lsp_config.lua_ls.setup {
            capabilities = capabilities,
            cmd = { "lua-language-server", "-E", "/usr/local/share/lua-language-server/main.lua" },
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
