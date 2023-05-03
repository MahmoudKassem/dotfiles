local function keymapSet(mode, keyCombination, action)
    vim.keymap.set(mode, keyCombination, action)
end

vim.g.mapleader = ' '
keymapSet('i', '<c-j>', '<c-n>')
keymapSet('i', '<c-k>', '<c-p>')
keymapSet('n', '<leader>c', function() vim.cmd.bwipeout() end)
keymapSet('n', '<leader>g', function ()
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
end)
keymapSet('n', '<leader>h', function() vim.cmd.wincmd('h') end)
keymapSet('n', '<leader>I', vim.treesitter.inspect_tree)
keymapSet('n', '<leader>j', function() vim.cmd.wincmd('j') end)
keymapSet('n', '<leader>k', function() vim.cmd.wincmd('k') end)
keymapSet('n', '<leader>l', function() vim.cmd.wincmd('l') end)
keymapSet('n', '<leader>q', function() vim.cmd.quit({bang = true}) end)
keymapSet('n', '<leader>Q', function() vim.cmd.qall({bang = true}) end)
keymapSet('n', '<leader>S', vim.show_pos)
keymapSet('n', '<leader>t', function()
    vim.cmd.sp()
    vim.cmd.terminal()
end)
keymapSet('n', '<leader>T', function()
    vim.cmd.vs()
    vim.cmd.terminal()
end)
keymapSet('n', '<leader>u', function()
    vim.cmd.write()
    vim.cmd.terminal('groff -mom % -k -U -T pdf > ~/docs/%:r.pdf')
end)
keymapSet('n', '<leader>w', function() vim.cmd.write() end)
keymapSet('n', '<leader>W', function() vim.cmd.wall() end)
keymapSet('n', '<leader>x', function() vim.cmd.xit() end)
keymapSet('n', '<leader>X', function() vim.cmd.xall() end)
keymapSet('n', '<leader><leader>', ':')
keymapSet('n', 'n', 'nzz')
keymapSet('n', 'N', 'Nzz')
keymapSet('t', '<leader><leader>', '<c-\\><c-n>')
