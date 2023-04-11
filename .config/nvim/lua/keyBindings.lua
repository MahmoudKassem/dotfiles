local keyMappingOptions = {noremap = true, silent = true}

vim.g.mapleader = ' '
vim.api.nvim_set_keymap('i', '<c-j>', '<c-n>', keyMappingOptions)
vim.api.nvim_set_keymap('i', '<c-k>', '<c-p>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>a', ':lua vim.lsp.buf.code_action()<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>b', ':Gitsigns toggle_current_line_blame<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>c', ':bwipeout<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>d', ':lua vim.lsp.buf.definition()<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>D', ':Telescope lsp_definitions<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>e', ':Telescope file_browser<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>F', ':lua vim.lsp.buf.format()<cr>', keyMappingOptions)
vim.keymap.set('n', '<leader>g', function ()
    local buf = vim.api.nvim_create_buf(false, true)
    local width = math.ceil(vim.o.columns * 0.9)
    local height = math.ceil(vim.o.lines * 0.9 - 4)
    local columns = math.ceil((vim.o.columns - width) * 0.5)
    local rows = math.ceil((vim.o.lines - height) * 0.5 - 2)
    vim.api.nvim_open_win(buf, true, {
        border = 'rounded',
        relative = 'editor',
        style = 'minimal',
        width = width,
        height = height,
        col = columns,
        row = rows
    })
    vim.cmd.terminal('lazygit')
end, keyMappingOptions)
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
vim.api.nvim_set_keymap('n', '<leader>P', ':Telescope projects<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>q', ':quit!<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>Q', ':qall!<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>r', ':lua vim.lsp.buf.rename()<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>s', ':Telescope live_grep<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>t', ':sp<cr>:terminal<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>T', ':vs<cr>:terminal<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>u', ':write<cr>:!groff -mom % -k -U -T pdf > ~/docs/%:r.pdf<cr><cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>v', ':lua vim.lsp.buf.hover()<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>w', ':write<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader>x', ':xit<cr>', keyMappingOptions)
vim.api.nvim_set_keymap('n', '<leader><leader>', ':', keyMappingOptions)
vim.api.nvim_set_keymap('n', 'n', 'nzz', keyMappingOptions)
vim.api.nvim_set_keymap('n', 'N', 'Nzz', keyMappingOptions)
vim.api.nvim_set_keymap('t', '<leader><leader>', '<c-\\><c-n>', keyMappingOptions)
vim.api.nvim_set_keymap('v', '<leader>J', ':m \'>+1<cr>gv=gv', keyMappingOptions)
vim.api.nvim_set_keymap('v', '<leader>K', ':m \'<-2<cr>gv=gv', keyMappingOptions)
