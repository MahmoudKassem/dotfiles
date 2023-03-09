local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous
      },
    },
    color_devicons = false
  },
  extensions = {
    file_browser = {
      hijack_netrw = true
    }
  }
}

telescope.load_extension("file_browser")
telescope.load_extension("projects")
telescope.load_extension("ui-select")
