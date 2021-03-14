local command = vim.api.nvim_command
local globalVariables = vim.g

command('syntax enable')
globalVariables.gruvbox_italics = 0
globalVariables.gruvbox_transp_bg = 1
command('colorscheme gruvbox8_hard')

--gray
command([[
highlight Comment guifg=#928374
highlight Todo guifg=#928374 ]])

--light blue
command([[
highlight Function guifg=#83a598
highlight Type guifg=#83a598
highlight Typedef guifg=#83a598 ]])

--light cyan
command([[
highlight Conditional guifg=#8ec07c
highlight Debug guifg=#8ec07c
highlight Exception guifg=#8ec07c
highlight Keyword guifg=#8ec07c
highlight Label guifg=#8ec07c
highlight LspDiagnosticsDefaultInformation guifg=#8ec07c
highlight Repeat guifg=#8ec07c
highlight SignifySignChange guifg=#8ec07c
highlight Special guifg=#8ec07c
highlight Statement guifg=#8ec07c
highlight StorageClass guifg=#8ec07c
highlight Structure guifg=#8ec07c ]])

--light green
command([[
highlight Constant guifg=#b8bb26
highlight String guifg=#b8bb26
highlight Character guifg=#b8bb26
highlight Number guifg=#b8bb26
highlight Boolean guifg=#b8bb26
highlight Float guifg=#b8bb26
highlight SignifySignAdd guifg=#b8bb26 ]])

--light magenta
command([[
highlight LspDiagnosticsDefaultHint guifg=#d3869b
highlight Operator guifg=#d3869b
highlight SpecialComment guifg=#d3869b ]])

--light orange
command([[
highlight Delimiter guifg=#fe8019
highlight LspDiagnosticsDefaultWarning guifg=#fe8019
highlight SpecialChar guifg=#fe8019 ]])

--light red
command([[
highlight LspDiagnosticsDefaultError guifg=#fb4934
highlight SignifySignDelete guifg=#fb4934 ]])

--white
command('highlight Identifier guifg=#ebdbb2')
