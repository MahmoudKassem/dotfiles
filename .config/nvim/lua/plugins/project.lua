return {
    'ahmedkhalf/project.nvim',
    lazy = true,
    config = function()
        require('project_nvim').setup({
            show_hidden = true
        })
    end
}
