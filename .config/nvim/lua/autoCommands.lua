local function autoCommand(command)
  vim.api.nvim_command('autocmd ' .. command)
end

autoCommand('TermClose * bwipeout')
autoCommand('TermOpen * startinsert')
autoCommand('TextYankPost * silent! lua vim.highlight.on_yank()')
