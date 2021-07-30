local keyMapping = vim.api.nvim_set_keymap
local keyMappingOptions = {noremap = true, silent = true}

vim.g.mapleader = ' '
keyMapping('i', '<leader>j', '<esc>:m .+1<cr>==', keyMappingOptions)
keyMapping('i', '<leader>k', '<esc>:m .-2<cr>==', keyMappingOptions)
keyMapping('n', '<leader>a', ':Telescope lsp_code_actions<cr>', keyMappingOptions)
keyMapping('n', '<leader>b', ':Telescope git_branches<cr>', keyMappingOptions)
keyMapping('n', '<leader>c', ':bwipeout<cr>', keyMappingOptions)
keyMapping('n', '<leader>d', ':lua vim.lsp.buf.definition()<cr>', keyMappingOptions)
keyMapping('n', '<leader>D', ':Telescope lsp_definitions<cr>', keyMappingOptions)
keyMapping('n', '<leader>e', ':Telescope file_browser<cr>', keyMappingOptions)
keyMapping('n', '<leader>f', ':Telescope find_files<cr>', keyMappingOptions)
keyMapping('n', '<leader>g', ':G', keyMappingOptions)
keyMapping('n', '<leader>H', ':wincmd h<cr>', keyMappingOptions)
keyMapping('n', '<leader>i', ':Telescope lsp_document_diagnostics<cr>', keyMappingOptions)
keyMapping('n', '<leader>j', ':m .+1<cr>==', keyMappingOptions)
keyMapping('n', '<leader>J', ':wincmd j<cr>', keyMappingOptions)
keyMapping('n', '<leader>k', ':m .-2<cr>==', keyMappingOptions)
keyMapping('n', '<leader>K', ':wincmd k<cr>', keyMappingOptions)
keyMapping('n', '<leader>L', ':wincmd l<cr>', keyMappingOptions)
keyMapping('n', '<leader>m', ':lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', keyMappingOptions)
keyMapping('n', '<leader>n', ':Telescope buffers<cr>', keyMappingOptions)
keyMapping('n', '<leader>o', ':Telescope lsp_references<cr>', keyMappingOptions)
keyMapping('n', '<leader>p', ':Telescope oldfiles<cr>', keyMappingOptions)
keyMapping('n', '<leader>q', ':quit!<cr>', keyMappingOptions)
keyMapping('n', '<leader>r', ':lua vim.lsp.buf.rename()<cr>', keyMappingOptions)
keyMapping('n', '<leader>s', ':Telescope live_grep<cr>', keyMappingOptions)
keyMapping('n', '<leader>t', ':chdir %:p:h<cr>:16sp term://zsh<cr>', keyMappingOptions)
keyMapping('n', '<leader>u', ':write<cr>:!groff -mom % -k -U -T pdf > ~/docs/%:r.pdf<cr><cr>', keyMappingOptions)
keyMapping('n', '<leader>v', ':lua vim.lsp.buf.hover()<cr>', keyMappingOptions)
keyMapping('n', '<leader>w', ':write<cr>', keyMappingOptions)
keyMapping('n', '<leader>x', ':xit<cr>', keyMappingOptions)
keyMapping('n', '<leader><leader>', ':', keyMappingOptions)
keyMapping('n', 'n', 'nzz', keyMappingOptions)
keyMapping('n', 'N', 'Nzz', keyMappingOptions)
keyMapping('n', 'Y', 'y$', keyMappingOptions)
keyMapping('t', '<esc>', '<c-\\><c-n>', keyMappingOptions)
keyMapping('v', '<leader>j', ':m \'>+1<cr>gv=gv', keyMappingOptions)
keyMapping('v', '<leader>k', ':m \'<-2<cr>gv=gv', keyMappingOptions)
