"general settings
set background=dark
set encoding=utf-8
set noswapfile
set nowrap
set number
set relativenumber
set splitbelow
set splitright
set termguicolors
set updatetime=128
filetype indent plugin on
syntax on
colorscheme gruvbox

"start integrated terminal in insert mode and map Esc for switching back to normal mode
autocmd TermOpen * startinsert
tnoremap <Esc> <C-\><C-n>

"make the background transparent
hi Normal guibg=NONE ctermbg=NONE

"recognize .pro as prolog files
au BufNewFile,BufRead *.pro set filetype=prolog

"custom key bindings
map <space>d :Lexplore<CR>
map <space>f :Rg<CR>
map <space>h :wincmd h<CR>
map <space>j :wincmd j<CR>
map <space>k :wincmd k<CR>
map <space>l :wincmd l<CR>
map <space>q :q!<CR>
map <space>s :Files<CR>
map <space>t :sp term://zsh<CR>
map <space>u :Explore<CR>

"configure gruvbox
let g:gruvbox_contrast_dark='hard'

"configure fzf
let $FZF_DEFAULT_OPTS='--extended'
let $FZF_DEFAULT_COMMAND='rg --files --ignore-case --hidden -g "!{.git}/*"'
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.7 } }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --iglob !\.git --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

"configure netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

"configure vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_gruvbox_dark_hard'

"configure vim-rooter
let g:rooter_patterns = ['.git']
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1

"load plugins
packadd fzf.vim
packadd gruvbox
packadd haskell-vim
packadd vim-airline
packadd vim-airline-themes
packadd vim-devicons
packadd vim-fugitive
packadd vim-gitgutter
packadd vim-rooter
packadd vim-surround
