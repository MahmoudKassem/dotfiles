local command = vim.api.nvim_command
local globalVariables = vim.g

--completion-nvim
globalVariables.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}

--netrw
globalVariables.netrw_banner = 0
globalVariables.netrw_browse_split = 4
globalVariables.netrw_bufsettings = 'nobuflisted number relativenumber'
globalVariables.netrw_liststyle = 3
globalVariables.netrw_preview = 1
globalVariables.netrw_winsize = 25
command([[
function ToggleNetrw()
  if exists("g:netrw_buffer") && bufexists(g:netrw_buffer)
    exe "bwipeout" . g:netrw_buffer | unlet g:netrw_buffer
  else
    Vexplore | let g:netrw_buffer=bufnr("%")
  endif
endfunction ]])

--vim-airline
globalVariables.airline_powerline_fonts = 1
globalVariables.airline_theme = 'base16_gruvbox_dark_hard'
globalVariables['airline#extensions#tabline#enabled'] = 1

--vim-rooter
globalVariables.rooter_change_directory_for_non_project_files = 'current'
globalVariables.rooter_patterns = {".git"}
globalVariables.rooter_resolve_links = 1
globalVariables.rooter_silent_chdir = 1
