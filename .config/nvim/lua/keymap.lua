local function keymapSet(mode, keyCombination, action)
    vim.keymap.set(mode, keyCombination, action)
end

local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
end

vim.g.mapleader = ' '
keymapSet('i', '<c-j>', '<c-n>')
keymapSet('i', '<c-k>', '<c-p>')
keymapSet('n', '<leader>a', vim.lsp.buf.code_action)
keymapSet('n', '<leader>b', function() vim.cmd.Gitsigns('toggle_current_line_blame') end)
keymapSet('n', '<leader>c', function() vim.cmd.bwipeout() end)
keymapSet('n', '<leader>d', vim.lsp.buf.definition)
keymapSet('n', '<leader>D', function() vim.cmd.Telescope('lsp_definitions') end)
keymapSet('n', '<leader>e', function() vim.cmd.Telescope('file_browser') end)
keymapSet('n', '<leader>f', function()
    if is_git_repo() then
        require"telescope.builtin".git_files()
    else
        require"telescope.builtin".find_files()
    end
end)
keymapSet('n', '<leader>F', vim.lsp.buf.format)
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
keymapSet('n', '<leader>i', function() vim.cmd.Telescope({'diagnostics', 'bufnr=0'}) end)
keymapSet('n', '<leader>j', function() vim.cmd.wincmd('j') end)
keymapSet('n', '<leader>J', ':m .+1<cr>==')
keymapSet('n', '<leader>k', function() vim.cmd.wincmd('k') end)
keymapSet('n', '<leader>K', ':m .-2<cr>==')
keymapSet('n', '<leader>l', function() vim.cmd.wincmd('l') end)
keymapSet('n', '<leader>L', function() vim.cmd.Lazy() end)
keymapSet('n', '<leader>m', function() vim.diagnostic.open_float({border = "rounded"}) end)
keymapSet('n', '<leader>n', function() vim.cmd.Telescope('buffers') end)
keymapSet('n', '<leader>o', function() vim.cmd.Telescope('lsp_references') end)
keymapSet('n', '<leader>p', function() vim.cmd.Telescope('oldfiles') end)
keymapSet('n', '<leader>P', function() vim.cmd.Telescope('projects') end)
keymapSet('n', '<leader>q', function() vim.cmd.quit({bang = true}) end)
keymapSet('n', '<leader>Q', function() vim.cmd.qall({bang = true}) end)
keymapSet('n', '<leader>r', vim.lsp.buf.rename)
keymapSet('n', '<leader>s', function()
    local function get_git_root()
        local dot_git_path = vim.fn.finddir(".git", ".;")
        return vim.fn.fnamemodify(dot_git_path, ":h")
    end
    local opts = {}
    if is_git_repo() then
        opts = {
            cwd = get_git_root(),
        }
    end
    require("telescope.builtin").live_grep(opts)
end)
keymapSet('n', '<leader>t', function() vim.cmd.sp() vim.cmd.terminal() end)
keymapSet('n', '<leader>T', function() vim.cmd.vs() vim.cmd.terminal() end)
keymapSet('n', '<leader>u', function()
    vim.cmd.write()
    vim.cmd.terminal('groff -mom % -k -U -T pdf > ~/docs/%:r.pdf')
end)
keymapSet('n', '<leader>v', vim.lsp.buf.hover)
keymapSet('n', '<leader>w', function() vim.cmd.write() end)
keymapSet('n', '<leader>W', function() vim.cmd.wall() end)
keymapSet('n', '<leader>x', function() vim.cmd.xit() end)
keymapSet('n', '<leader>X', function() vim.cmd.xall() end)
keymapSet('n', '<leader><leader>', ':')
keymapSet('n', 'n', 'nzz')
keymapSet('n', 'N', 'Nzz')
keymapSet('t', '<leader><leader>', '<c-\\><c-n>')
keymapSet('v', '<leader>J', ':m \'>+1<cr>gv=gv')
keymapSet('v', '<leader>K', ':m \'<-2<cr>gv=gv')
