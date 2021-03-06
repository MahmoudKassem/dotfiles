--general settings
vim.cmd [[
set autowrite
set background=dark
set clipboard=unnamedplus
set completeopt=menuone,noinsert,noselect
set colorcolumn=128
set cursorline
set encoding=utf-8
set expandtab
set ignorecase
set nobackup
set nohlsearch
set noshowmode
set noswapfile
set nowritebackup
set number
set relativenumber
set scrolloff=2
set shiftwidth=2
set signcolumn=yes
set smartcase
set splitbelow
set splitright
set tabstop=2
set termguicolors
set updatetime=64 ]]

--auto commands
vim.cmd [[
autocmd BufNewFile,BufRead *.pro set filetype=prolog
autocmd FileType qf nnoremap <buffer> <cr> <cr>:cclose<cr>
autocmd FileType qf nnoremap <s-k> :cnext<cr>:wincmd j<cr>
autocmd FileType qf nnoremap <s-j> :cprev<cr>:wincmd j<cr>
autocmd TermOpen * startinsert
autocmd TextYankPost * silent! lua vim.highlight.on_yank() ]]

--custom key bindings
vim.cmd [[
let mapleader = " "
nnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <silent> <leader>b :buffers<cr>:buffer<space>
nnoremap <silent> <leader>c :bwipeout<cr>
nnoremap <silent> <leader>d <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> <leader>e :call ToggleNetrw()<cr>
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>h :wincmd h<cr>
nnoremap <silent> <leader>g :w<cr>:!groff -k -ms % -T pdf -U > %:r.pdf<cr><cr>
nnoremap <silent> <leader>j :wincmd j<cr>
nnoremap <silent> <leader>k :wincmd k<cr>
nnoremap <silent> <leader>l :wincmd l<cr>
nnoremap <silent> <leader>o :badd<space>
nnoremap <silent> <leader>q :quit!<cr>
nnoremap <silent> <leader>r <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> <leader>s :Rg<cr>
nnoremap <silent> <leader>t :chdir %:p:h<cr>:16sp term://zsh<cr>
nnoremap <silent> <leader>u :Explore<cr>
nnoremap <silent> <leader>v <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> <leader>w :write<cr>
nnoremap <silent> <leader>x :xit<cr>
nnoremap <silent> <leader><leader> :
nnoremap <silent> <s-k> :bnext<cr>
nnoremap <silent> <s-j> :bprevious<cr>
tnoremap <silent> <esc> <c-\><c-n> ]]

--configure completion-nvim
vim.cmd [[ let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy'] ]]

--configure fzf
vim.cmd [[
let $FZF_DEFAULT_COMMAND='rg --files --ignore-case --hidden -g "!{.git}/*"'
let $FZF_DEFAULT_OPTS='--extended'
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --iglob !\.git --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0) ]]

--configure netrw
vim.cmd [[
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_bufsettings = 'nobuflisted number relativenumber'
let g:netrw_liststyle = 3
let g:netrw_preview = 1
let g:netrw_winsize = 25
function ToggleNetrw()
  if exists("g:netrw_buffer") && bufexists(g:netrw_buffer)
    exe "bwipeout" . g:netrw_buffer | unlet g:netrw_buffer
  else
    Vexplore | let g:netrw_buffer=bufnr("%")
  endif
endfunction ]]

--set gruvbox-material
vim.cmd [[
let g:gruvbox_italics = 0
let g:gruvbox_transp_bg = 1 ]]

--configure vim-airline
vim.cmd [[
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled = 1 ]]

--configure vim-rooter
vim.cmd [[
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['.git']
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir = 1 ]]

--enable syntax highlighting
vim.cmd [[ syntax enable ]]

--set colorscheme
vim.cmd [[ colorscheme gruvbox8_hard ]]

--gray
vim.cmd [[
highlight Comment guifg=#928374
highlight Todo guifg=#928374 ]]

--light blue
vim.cmd [[
highlight Function guifg=#83a598
highlight Type guifg=#83a598
highlight Typedef guifg=#83a598 ]]

--light cyan
vim.cmd [[
highlight Conditional guifg=#8ec07c
highlight Debug guifg=#8ec07c
highlight Exception guifg=#8ec07c
highlight Keyword guifg=#8ec07c
highlight Label guifg=#8ec07c
highlight LspDiagnosticsDefaultInformation guifg=#8ec07c
highlight Repeat guifg=#8ec07c
highlight SignifySignChange guifg=#8ec07c
highlight Special guifg=#8ec07c
highlight Statement guifg=#8ec07c
highlight StorageClass guifg=#8ec07c
highlight Structure guifg=#8ec07c ]]

--light green
vim.cmd [[
highlight Constant guifg=#b8bb26
highlight String guifg=#b8bb26
highlight Character guifg=#b8bb26
highlight Number guifg=#b8bb26
highlight Boolean guifg=#b8bb26
highlight Float guifg=#b8bb26
highlight SignifySignAdd guifg=#b8bb26 ]]

--light magenta
vim.cmd [[
highlight LspDiagnosticsDefaultHint guifg=#d3869b
highlight Operator guifg=#d3869b
highlight SpecialComment guifg=#d3869b ]]

--light orange
vim.cmd [[
highlight Delimiter guifg=#fe8019
highlight LspDiagnosticsDefaultWarning guifg=#fe8019
highlight SpecialChar guifg=#fe8019 ]]

--light red
vim.cmd [[
highlight LspDiagnosticsDefaultError guifg=#fb4934
highlight SignifySignDelete guifg=#fb4934 ]]

--white
vim.cmd [[ highlight Identifier guifg=#ebdbb2 ]]

--load plugins
vim.cmd [[
packadd auto-pairs
packadd completion-nvim
packadd fzf.vim
packadd haskell-vim
packadd nvim-lspconfig
packadd nvim-treesitter
packadd vim-airline
packadd vim-airline-themes
packadd vim-commentary
packadd vim-devicons
packadd vim-fugitive
packadd vim-rooter
packadd vim-surround
packadd vim-signify ]]

--setup language servers
require('lsp_config')

--setup treesitter
require('treesitter_config')
