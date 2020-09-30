"enable syntax highlighting and file specific indenting
filetype indent plugin on
syntax on

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
set nowritebackup
set noswapfile
set noshowmode
set number
set relativenumber
set signcolumn=yes
set splitbelow
set splitright
set termguicolors
set tabstop=2
set shiftwidth=2
set updatetime=128

"auto commands
au BufNewFile,BufRead *.pro set filetype=prolog
au TermOpen * startinsert
au TextYankPost * silent! lua vim.highlight.on_yank()

"custom key bindings
nnoremap <silent> <space>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <space>d <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <space>e :Lexplore<CR>
nnoremap <silent> <space>f :FZF<CR>
nnoremap <silent> <space>h :wincmd h<CR>
nnoremap <silent> <space>j :wincmd j<CR>
nnoremap <silent> <space>k :wincmd k<CR>
nnoremap <silent> <space>l :wincmd l<CR>
nnoremap <silent> <space>q :q!<CR>
nnoremap <silent> <space>r <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <space>s :Rg<CR>
nnoremap <silent> <space>t :cd %:p:h<CR>:16sp term://zsh<CR>
nnoremap <silent> <space>u :Explore<CR>
nnoremap <silent> <space>v <cmd>lua vim.lsp.buf.hover()<CR>
tnoremap <silent> <Esc> <C-\><C-n>

"configure completion-nvim
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

"configure diagnostic-nvim
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = ''

"configure fzf
let $FZF_DEFAULT_OPTS='--extended'
let $FZF_DEFAULT_COMMAND='rg --files --ignore-case --hidden -g "!{.git}/*"'
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
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_background = 'soft'

"configure vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox_material'

"configure vim-rooter
let g:rooter_patterns = ['.git']
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1

"load plugins
packadd completion-nvim
packadd diagnostic-nvim
packadd fzf.vim
packadd gruvbox-material
packadd nvim-lspconfig
packadd vim-airline
packadd vim-airline-themes
packadd vim-devicons
packadd vim-fugitive
packadd vim-polyglot
packadd vim-rooter
packadd vim-signify
packadd vim-surround

"set colorscheme
colorscheme gruvbox-material

"setup language servers
lua require('lsp_config')
