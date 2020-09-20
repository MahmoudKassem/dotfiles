"general settings
set autochdir
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

"extend FZFs'Files command to look from the root if inside a git project
command! GitProjectFiles execute 'Files' system('git rev-parse --show-toplevel 2> /dev/null')[:-2]

"custom key bindings
map <space>d :Lexplore<CR>
map <space>f :Rg<CR>
map <space>h :wincmd h<CR>
map <space>j :wincmd j<CR>
map <space>k :wincmd k<CR>
map <space>l :wincmd l<CR>
map <space>q :q!<CR>
map <space>s :GitProjectFiles<CR>
map <space>t :sp term://zsh<CR>
map <space>u :Explore<CR>

"configure netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

"configure gruvbox
let g:gruvbox_contrast_dark='hard'

"configure vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_gruvbox_dark_hard'

"load plugins
packadd fzf.vim
packadd gruvbox
packadd haskell-vim
packadd vim-airline
packadd vim-airline-themes
packadd vim-devicons
packadd vim-fugitive
packadd vim-gitgutter
packadd vim-surround
