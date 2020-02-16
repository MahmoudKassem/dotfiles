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

"disable linewrap
set nowrap

"automatically change the directory when opening a new file
set autochdir

"enable the visualbell
set visualbell

"configure netrw file browser
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_preview = 1
let g:netrw_winsize = 80

"use powerline glyphs in vim airline
let g:airline_powerline_fonts = 1

"make the background transparent
hi Normal guibg=NONE ctermbg=NONE

"recognize .pro as prolog files
au BufNewFile,BufRead *.pro set filetype=prolog

"activate pathogen plugin manager
execute pathogen#infect()
