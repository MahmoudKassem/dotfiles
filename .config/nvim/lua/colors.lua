local command = vim.api.nvim_command
local globalVariables = vim.g

globalVariables.gruvbox_italics = 0
globalVariables.gruvbox_transp_bg = 1
command('syntax enable')
command('colorscheme gruvbox8_hard')

local function highlight(highlightGroup, foreGroundHexColorCode)
  command('highlight ' .. highlightGroup .. ' guifg=' .. foreGroundHexColorCode)
end

local grey = '#928374'
local lightBlue = '#83a598'
local lightCyan = '#8ec07c'
local lightGreen = '#b8bb26'
local lightMagenta = '#d3869b'
local lightOrange ='#fe8019'
local lightRed = '#fb4934'
local white = '#ebdbb2'

highlight('Comment', grey)
highlight('Todo', grey)

highlight('Function', lightBlue)
highlight('Type', lightBlue)
highlight('Typedef', lightBlue)

highlight('Conditional', lightCyan)
highlight('Debug', lightCyan)
highlight('Exception', lightCyan)
highlight('Keyword', lightCyan)
highlight('Label', lightCyan)
highlight('LspDiagnosticsDefaultInformation', lightCyan)
highlight('Conditional', lightCyan)
highlight('Debug', lightCyan)
highlight('Exception', lightCyan)
highlight('Keyword', lightCyan)
highlight('Label', lightCyan)
highlight('LspDiagnosticsDefaultInformation', lightCyan)
highlight('Repeat', lightCyan)
highlight('SignifySignChange', lightCyan)
highlight('Special', lightCyan)
highlight('Statement', lightCyan)
highlight('StorageClass', lightCyan)
highlight('Structure', lightCyan)

highlight('Constant', lightGreen)
highlight('String', lightGreen)
highlight('Character', lightGreen)
highlight('Number', lightGreen)
highlight('Boolean', lightGreen)
highlight('Float', lightGreen)
highlight('SignifySignAdd', lightGreen)

highlight('LspDiagnosticsDefaultHint', lightMagenta)
highlight('Operator', lightMagenta)
highlight('SpecialComment', lightMagenta)

highlight('Delimiter', lightOrange)
highlight('LspDiagnosticsDefaultWarning', lightOrange)
highlight('SpecialChar', lightOrange)

highlight('LspDiagnosticsDefaultError', lightRed)
highlight('SignifySignDelete', lightRed)

highlight('Identifier', white)
