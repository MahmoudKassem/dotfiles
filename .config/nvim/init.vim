"load plugins with vim-plug
call plug#begin('~/.local/share/nvim/site/plugged')
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'neovimhaskell/haskell-vim'
  Plug 'mahmoudkassem/vim-devicons'
  Plug 'mahmoudkassem/gruvbox'
call plug#end()

"use true color mode
set termguicolors

"write file to disk after 128 milliseconds without typing
set updatetime=128

"no swap files
set noswapfile

"configure netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent 25Lexplore
    endif
endfunction

"custom key bindings
let mapleader = " "
map <leader>t :sp term://zsh<CR>
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <leader>q :q!<CR>
map <leader>i :PlugInstall<CR>
map <leader>g :PlugUpgrade<CR>
map <leader>u :PlugUpdate<CR>
map <leader>c :PlugClean<CR>
map <leader>n :call ToggleNetrw()<CR>

"set the gruvbox theme
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

"configure vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_gruvbox_dark_hard'

"enable syntax highlighting
syntax on filetype plugin

"set the charset
set encoding=utf-8 fileencoding=utf-8

"set tab to be 4 characters wide
set tabstop=4 shiftwidth=4 expandtab

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

"settings for the integrated terminal emulator of neovim
autocmd TermOpen * startinsert
tnoremap <Esc> <C-\><C-n>

"make the background transparent
hi Normal guibg=NONE ctermbg=NONE

"recognize .pro as prolog files
au BufNewFile,BufRead *.pro set filetype=prolog
