"general settings
set autowrite
set background=dark
set completeopt=menuone,noinsert,noselect
set colorcolumn=128
set encoding=utf-8
set expandtab
set hidden
set incsearch
set nobackup
set noshowmode
set noswapfile
set nowritebackup
set number
set relativenumber
set shiftwidth=2
set signcolumn=yes
set splitbelow
set splitright
set tabstop=2
set termguicolors
set updatetime=128

"auto commands
au BufNewFile,BufRead *.pro set filetype=logtalk
au TermOpen * startinsert
au TextYankPost * silent! lua vim.highlight.on_yank()

"custom key bindings
let mapleader = " "
nnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>d <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>e :Lexplore<CR>
nnoremap <silent> <leader>f :FZF<CR>
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>q :q!<CR>
nnoremap <silent> <leader>r <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>s :Rg<CR>
nnoremap <silent> <leader>t :cd %:p:h<CR>:16sp term://zsh<CR>
nnoremap <silent> <leader>u :Explore<CR>
nnoremap <silent> <leader>v <cmd>lua vim.lsp.buf.hover()<CR>
tnoremap <silent> <Esc> <C-\><C-n>

"configure completion-nvim
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

"configure diagnostic-nvim
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_show_sign = 0
let g:diagnostic_virtual_text_prefix = ''

"configure fzf
let $FZF_DEFAULT_COMMAND='rg --files --ignore-case --hidden -g "!{.git}/*"'
let $FZF_DEFAULT_OPTS='--extended'
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --iglob !\.git --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

"configure netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

"set gruvbox-material
let g:gruvbox_italics = 0
let g:gruvbox_transp_bg = 1

"configure vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_gruvbox_dark_hard'

"configure vim-rooter
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['.git']
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir = 1

"enable syntax highlighting
syntax enable

"set colorscheme
colorscheme gruvbox8_hard

"gray
hi Comment guifg=#928374
hi Todo guifg=#928374

"light green
hi Constant guifg=#b8bb26
hi String guifg=#b8bb26
hi Character guifg=#b8bb26
hi Number guifg=#b8bb26
hi Boolean guifg=#b8bb26
hi Float guifg=#b8bb26

"light blue
hi Function guifg=#83a598
hi Type guifg=#83a598

"light cyan
hi Conditional guifg=#8ec07c
hi Debug guifg=#8ec07c
hi Exception guifg=#8ec07c
hi Keyword guifg=#8ec07c
hi Label guifg=#8ec07c
hi Repeat guifg=#8ec07c
hi Special guifg=#8ec07c
hi Statement guifg=#8ec07c
hi StorageClass guifg=#8ec07c
hi Structure guifg=#8ec07c

"light magenta
hi Operator guifg=#d3869b
hi SpecialComment guifg=#d3869b

"light orange
hi Delimiter guifg=#fe8019
hi SpecialChar guifg=#fe8019

"load plugins
packadd auto-pairs
packadd completion-nvim
packadd diagnostic-nvim
packadd fzf.vim
packadd haskell-vim
packadd nvim-lspconfig
packadd nvim-treesitter
" packadd nvim-treesitter-refactor
packadd vim-airline
packadd vim-airline-themes
packadd vim-commentary
packadd vim-devicons
packadd vim-fugitive
packadd vim-rooter
packadd vim-signify
packadd vim-surround

"setup treesitter
lua require('treesitter_config')

"setup language servers
lua require('lsp_config')
