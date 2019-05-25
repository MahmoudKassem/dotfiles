"set the look
colorscheme gruvbox
syntax on
filetype plugin indent on
set bg=dark
set encoding=utf-8
set fileencoding=utf-8
set tabstop=4
set autoindent
set number
set relativenumber

"so that the terminal created with the :terminal command appears below
set splitbelow

"enable powerline
let g:powerline_pycmd="py3"
set laststatus=2
set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim

"make the background transparent
hi Normal guibg=NONE ctermbg=NONE

"recognize .pro as prolog files
au BufNewFile,BufRead *.pro set filetype=prolog

"activate pathogen plugin manager
execute pathogen#infect()
