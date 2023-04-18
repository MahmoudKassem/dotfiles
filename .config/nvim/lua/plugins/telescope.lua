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
