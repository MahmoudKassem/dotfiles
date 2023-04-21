local function is_git_repo()
    vim.fn.system('git rev-parse --is-inside-work-tree')
    return vim.v.shell_error == 0
end

return {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-project.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'ahmedkhalf/project.nvim'
    },
    keys = {
        {'<leader>e', function () vim.cmd.Telescope('file_browser') end},
        {'<leader>f', function()
            if is_git_repo() then
                require('telescope.builtin').git_files()
            else
                require('telescope.builtin').find_files()
            end
        end},
        {'<leader>n', function () vim.cmd.Telescope('buffers') end},
        {'<leader>p', function () vim.cmd.Telescope('oldfiles') end},
        {'<leader>P', function () vim.cmd.Telescope('projects') end},
        {'<leader>s', function()
            local function get_git_root()
                local dot_git_path = vim.fn.finddir('.git', '.;')
                return vim.fn.fnamemodify(dot_git_path, ':h')
            end
            local opts = {}
            if is_git_repo() then
                opts = {
                    cwd = get_git_root(),
                }
            end
            require('telescope.builtin').live_grep(opts)
        end},
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local action_layout = require('telescope.actions.layout')
        telescope.setup{
            defaults = {
                color_devicons = false,
                mappings = {
                    i = {
                        ['<c-j>'] = actions.move_selection_next,
                        ['<c-k>'] = actions.move_selection_previous,
                        ['<c-p>'] = action_layout.toggle_preview
                    },
                    n = {
                        ['<c-p>'] = action_layout.toggle_preview
                    }
                }
            }
        }

        telescope.load_extension('file_browser')
        telescope.load_extension('projects')
        telescope.load_extension('ui-select')
    end
}
