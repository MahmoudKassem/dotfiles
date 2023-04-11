local function autoCommand(event, callback, options)
    vim.api.nvim_create_autocmd(event, {
        callback = function() callback(options) end
    })
end

autoCommand('TermClose', vim.cmd.bwipeout)
autoCommand('TermOpen', vim.cmd.startinsert)
autoCommand('TextYankPost', vim.highlight.on_yank)
