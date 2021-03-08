local command = vim.cmd
local globalVariables = vim.g
local environmentVariables = vim.env

--completion-nvim
globalVariables.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}

--fzf
environmentVariables.FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git}/*"'
environmentVariables.FZF_DEFAULT_OPTS = '--extended'
globalVariables.fzf_history_dir = '~/.local/share/fzf-history'
globalVariables.fzf_layout = { window = { width = 0.8, height = 0.8 } }
command([[ command! -bang -nargs=* Rg call fzf#vim#grep('rg --hidden --iglob !\.git --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0) ]])

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
