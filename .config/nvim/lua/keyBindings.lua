local keyMappingOptions = {noremap = true, silent = true}

vim.g.mapleader = ' '
vim.api.nvim_set_keymap('i', '<c-j>', '<c-n>', keyMappingOptions)
vim.api.nvim_set_keymap('i', '<c-k>', '<c-p>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>a', ':Telescope lsp_code_actions<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope git_branches<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>c', ':bwipeout<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>d', ':lua vim.lsp.buf.definition()<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>D', ':Telescope lsp_definitions<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>e', ':Telescope file_browser<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>F', ':lua vim.lsp.buf.formatting()<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>g', ':G', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>i', ':Telescope diagnostics bufnr=0<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>J', ':m .+1<cr>==', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>K', ':m .-2<cr>==', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>m', ':lua vim.diagnostic.open_float({border = "rounded"})<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>n', ':Telescope buffers<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>o', ':Telescope lsp_references<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>p', ':Telescope oldfiles<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>q', ':quit!<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>Q', ':qall!<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>r', ':lua vim.lsp.buf.rename()<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>s', ':Telescope live_grep<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>t', ':chdir %:p:h<cr>:sp term://zsh<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>T', ':chdir %:p:h<cr>:vs term://zsh<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>u', ':write<cr>:!groff -mom % -k -U -T pdf > ~/docs/%:r.pdf<cr><cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>v', ':lua vim.lsp.buf.hover()<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>w', ':write<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>x', ':xit<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader><leader>', ':', keyMappingOptions)
vim.api.nvim_set_keymap('n', 'n', 'nzz', keyMappingOptions)
vim.api.nvim_set_keymap('n', 'N', 'Nzz', keyMappingOptions)
vim.api.nvim_set_keymap('t', '<esc>', '<c-\\><c-n>', keyMappingOptions)
vim.api.nvim_set_keymap('v', '<leader>J', ':m \'>+1<cr>gv=gv', keyMappingOptions)
vim.api.nvim_set_keymap('v', '<leader>K', ':m \'<-2<cr>gv=gv', keyMappingOptions)
