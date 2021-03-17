local function autoCommand(command)
  vim.api.nvim_command('autocmd ' .. command)
end

autoCommand('BufEnter *.pro set filetype=prolog')
autoCommand('TermOpen * startinsert')
autoCommand('TextYankPost * silent! lua vim.highlight.on_yank()')
