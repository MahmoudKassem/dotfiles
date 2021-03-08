local function autoCommand(command)
  vim.cmd('autocmd ' .. command)
end

autoCommand('BufNewFile,BufRead *.pro set filetype=prolog')
autoCommand('FileType qf nnoremap <buffer> <cr> <cr>:cclose<cr>')
autoCommand('FileType qf nnoremap <s-k> :cnext<cr>:wincmd j<cr>')
autoCommand('FileType qf nnoremap <s-j> :cprev<cr>:wincmd j<cr>')
autoCommand('TermOpen * startinsert')
autoCommand('TextYankPost * silent! lua vim.highlight.on_yank()')
