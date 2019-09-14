"set the gruvbox theme
colorscheme gruvbox
set bg=dark

"enable syntax highlighting
syntax on filetype plugin

"set the charset
set encoding=utf-8 fileencoding=utf-8

"set tab to be 4 characters wide
set tabstop=4

"make whitespace visible
set listchars=eol:¬,tab:>>,trail:~,space:. list

"enable the numberline with relative numbering
set number relativenumber

"set horizontal splits to appear below and vertical splits to appear on the right
set splitbelow splitright

"enable the visualbell
set visualbell

"configure powerline plug-in
let g:powerline_pycmd="py3"
set laststatus=2
set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim

"make the background transparent
hi Normal guibg=NONE ctermbg=NONE

"recognize .pro as prolog files
au BufNewFile,BufRead *.pro set filetype=prolog

"activate pathogen plugin manager
execute pathogen#infect()
