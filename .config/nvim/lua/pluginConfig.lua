local globalVariables = vim.g

--completion-nvim
globalVariables.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}

--vim-airline
globalVariables.airline_powerline_fonts = 1
globalVariables.airline_theme = 'base16_gruvbox_dark_hard'
globalVariables['airline#extensions#tabline#enabled'] = 1

--vim-rooter
globalVariables.rooter_change_directory_for_non_project_files = 'current'
globalVariables.rooter_patterns = {".git", "*.mod", "stack*.yaml"}
globalVariables.rooter_resolve_links = 1
globalVariables.rooter_silent_chdir = 1
