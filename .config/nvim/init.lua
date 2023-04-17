require('autocommands')
require('colors')
require('filetype')
require('keymap')
require('options')
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
    {
        'numToStr/Comment.nvim',
        keys = 'gc',
        config = true
    },
    {
        'lewis6991/gitsigns.nvim',
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
        end
    },
    {
        'ggandor/leap.nvim',
        keys = {'s', 'S', 'gs'},
        config = function()
            require('leap').add_default_mappings()
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            local file = {
                'filename',
                file_status = true
            }

            local lightCyan = '#8ec07c'
            local lightMagenta = '#d3869b'
            local lightOrange = '#fe8019'
            local lightRed = '#fb4934'

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
                color_error = lightRed,
                color_warn = lightOrange,
                color_hint = lightMagenta,
                color_info = lightCyan
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
                        {
                            'branch',
                            icon = ''
                        },
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
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        keys = ':',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'onsails/lspkind.nvim',
            'rafamadriz/friendly-snippets',
            'saadparwaiz1/cmp_luasnip',
            'windwp/nvim-autopairs'
        },
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
            require('nvim-autopairs').setup()

            local luasnip = require('luasnip')
            local cmp = require('cmp')
            cmp.setup {
                formatting = {
                    format = require('lspkind').cmp_format()
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-j>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<C-k>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                sources = {
                    { name = 'luasnip' },
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'path' },
                    { name = 'buffer' }
                }
            }

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'cmdline' }
                }
            })

            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })
        end
    },
    {
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
    },
    {
        'nvim-treesitter/nvim-treesitter',
        ft = {'go', 'haskell', 'lua', 'sh', 'query'},
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {'go', 'haskell', 'lua', 'bash', 'query'},
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                },
                query_linter = {
                    enable = true,
                    use_virtual_text = true,
                    lint_events = {"BufWrite", "CursorHold"},
                }
            }
        end
    },
    {
        'kylechui/nvim-surround',
        keys = {'ys', 'cs', 'ds'},
        config = true
    },
    {
        'nvim-tree/nvim-web-devicons',
        lazy = true,
        config = function()
            require('nvim-web-devicons').setup {
                override = {
                    pro = {
                        icon = "",
                        color = "#e37933",
                        name = "Prolog"
                    },
                    mom = {
                        icon = "",
                        color = "#6d8086",
                        name = "Groff_Mom"
                    }
                }
            }
        end
    },
    {
        'nvim-treesitter/playground',
        cmd = 'TSPlaygroundToggle',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        }
    },
    {
        'ahmedkhalf/project.nvim',
        event = 'VeryLazy',
        config = function()
            require("project_nvim").setup({
                show_hidden = true
            })
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            'nvim-telescope/telescope-project.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            'ahmedkhalf/project.nvim'
        },
        config = function()
            local telescope = require('telescope')
            local actions = require('telescope.actions')
            local action_layout = require("telescope.actions.layout")
            telescope.setup{
                defaults = {
                    color_devicons = false,
                    mappings = {
                        i = {
                            ["<c-j>"] = actions.move_selection_next,
                            ["<c-k>"] = actions.move_selection_previous,
                            ["<c-p>"] = action_layout.toggle_preview
                        },
                        n = {
                            ["<c-p>"] = action_layout.toggle_preview
                        }
                    }
                }
            }

            telescope.load_extension("file_browser")
            telescope.load_extension("projects")
            telescope.load_extension("ui-select")
        end
    }
},
{
    ui = {
        border = 'rounded'
    },
    checker = {
        enabled = true
    },
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                'matchit',
                'netrwPlugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin'
            },
        },
    }
})
