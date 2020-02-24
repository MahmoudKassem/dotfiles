"run plugins in ./vim/bundle folder
execute pathogen#infect()

"use true color mode
set termguicolors

"set the gruvbox theme
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

"enable syntax highlighting
syntax on filetype plugin

"set the charset
set encoding=utf-8 fileencoding=utf-8

"set tab to be 4 characters wide
set tabstop=4

"set horizontal splits to appear below and vertical splits to appear on the right
set splitbelow splitright

"assign characters to whitespace these can be made visible by running ':set list'
set listchars=eol:¬,tab:>>,trail:~,space:.

"enable the numberline with relative numbering
set number relativenumber

"disable linewrap
set nowrap

"automatically change the directory when opening a new file
set autochdir

"enable the visualbell
set visualbell

"configure vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_gruvbox_dark_hard'

"configure syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"make the background transparent
hi Normal guibg=NONE ctermbg=NONE

"recognize .pro as prolog files
au BufNewFile,BufRead *.pro set filetype=prolog
