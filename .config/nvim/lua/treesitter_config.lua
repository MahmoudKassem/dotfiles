require('nvim-treesitter.configs').setup {
  highlight = { enable = true },
  refactor = {
    highlight_current_scope = { enable = true },
    highlight_definitions = { enable = true }
  }
}
