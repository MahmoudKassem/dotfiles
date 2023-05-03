local function autoCommand(event, callback, pattern)
    vim.api.nvim_create_autocmd(event, {
        callback = function() callback() end,
        pattern = pattern or '*'
    })
end

autoCommand('Filetype', function()
    vim.cmd.syntax('enable')
end,
{'checkhealth','gitcommit', 'groff', 'swayconfig', 'tsplayground', 'zsh'})
autoCommand('Filetype', function()
    vim.cmd.so('~/.local/share/nvim/site/syntax/prolog.vim')
end, 'prolog')
autoCommand('UIEnter', vim.cmd.edit)
autoCommand('TermClose', vim.cmd.bwipeout)
autoCommand('TermOpen', vim.cmd.startinsert)
autoCommand('TextYankPost', vim.highlight.on_yank)
