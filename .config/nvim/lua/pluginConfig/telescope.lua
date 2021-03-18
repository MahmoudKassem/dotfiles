local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close
      },
    },
  }
}

local M = {}
M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end
return M
