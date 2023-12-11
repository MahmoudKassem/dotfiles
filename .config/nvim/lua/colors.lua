--colors from https://github.com/morhetz/gruvbox

vim.cmd.colorscheme('vim')
vim.g.colors_name = 'gruvbox'
vim.cmd.syntax('off')

local gruvboxDarkMode = {
  background0Hard = '#1d2021',
  background1 = '#3c3836',
  foreground = '#ebdbb2',
  grey = '#928374',
  lightBlue = '#83a598',
  lightCyan = '#8ec07c',
  lightGreen = '#b8bb26',
  lightMagenta = '#d3869b',
  lightOrange ='#fe8019',
  lightRed = '#fb4934'
}

local function highlight(highlightGroup, foregroundHexColorCode, backgroundHexColorCode, guiOption)
    foregroundHexColorCode = foregroundHexColorCode or 'normal'
    backgroundHexColorCode = backgroundHexColorCode or 'none'
    guiOption = guiOption or 'none'
    local colors = ' guibg=' .. backgroundHexColorCode .. ' guifg=' .. foregroundHexColorCode .. ' gui='  ..guiOption
    vim.cmd.highlight(highlightGroup .. colors)
end

highlight('CursorLine')
highlight('DiffText', nil, nil, 'reverse')
highlight('EndOfBuffer', gruvboxDarkMode.background0Hard)
highlight('MatchParen', nil, nil, 'reverse')
highlight('PmenuSel', gruvboxDarkMode.background0Hard, gruvboxDarkMode.lightOrange)
highlight('PmenuSbar', nil, gruvboxDarkMode.background1)
highlight('PmenuThumb', nil, gruvboxDarkMode.lightOrange)
highlight('Search', gruvboxDarkMode.background0Hard, gruvboxDarkMode.lightOrange)
highlight('SignColumn')
highlight('Visual', nil, nil, 'reverse')

highlight('StatusLine', gruvboxDarkMode.background1)
highlight('StatusLineNC', gruvboxDarkMode.background1)

highlight('CmpItemAbbr', gruvboxDarkMode.foreground)
highlight('CmpItemKind', gruvboxDarkMode.foreground)
highlight('Identifier', gruvboxDarkMode.foreground)
highlight('LspInfoBorder', gruvboxDarkMode.foreground)
highlight('NonText', gruvboxDarkMode.foreground)
highlight('Pmenu', gruvboxDarkMode.foreground)
highlight('VertSplit', gruvboxDarkMode.foreground)

highlight('Comment', gruvboxDarkMode.grey)
highlight('LineNr', gruvboxDarkMode.grey)
highlight('Todo', gruvboxDarkMode.grey)

highlight('Function', gruvboxDarkMode.lightBlue)
highlight('Type', gruvboxDarkMode.lightBlue)
highlight('Typedef', gruvboxDarkMode.lightBlue)
highlight('Question', gruvboxDarkMode.lightBlue)

highlight('Conceal', gruvboxDarkMode.lightCyan)
highlight('Conditional', gruvboxDarkMode.lightCyan)
highlight('Debug', gruvboxDarkMode.lightCyan)
highlight('Define', gruvboxDarkMode.lightCyan)
highlight('DiagnosticInfo', gruvboxDarkMode.lightCyan)
highlight('DiffChange', gruvboxDarkMode.lightCyan)
highlight('diffChanged', gruvboxDarkMode.lightCyan)
highlight('Exception', gruvboxDarkMode.lightCyan)
highlight('Include', gruvboxDarkMode.lightCyan)
highlight('Keyword', gruvboxDarkMode.lightCyan)
highlight('Label', gruvboxDarkMode.lightCyan)
highlight('LspDiagnosticsDefaultInformation', gruvboxDarkMode.lightCyan)
highlight('Macro', gruvboxDarkMode.lightCyan)
highlight('PreCondit', gruvboxDarkMode.lightCyan)
highlight('PreProc', gruvboxDarkMode.lightCyan)
highlight('Repeat', gruvboxDarkMode.lightCyan)
highlight('SignifySignChange', gruvboxDarkMode.lightCyan)
highlight('Special', gruvboxDarkMode.lightCyan)
highlight('SpecialKey', gruvboxDarkMode.lightCyan)
highlight('Statement', gruvboxDarkMode.lightCyan)
highlight('StorageClass', gruvboxDarkMode.lightCyan)
highlight('Structure', gruvboxDarkMode.lightCyan)
highlight('Title', gruvboxDarkMode.lightCyan)

highlight('Constant', gruvboxDarkMode.lightGreen)
highlight('DiffAdd', gruvboxDarkMode.lightGreen)
highlight('diffAdded', gruvboxDarkMode.lightGreen)
highlight('Directory', gruvboxDarkMode.lightGreen)
highlight('String', gruvboxDarkMode.lightGreen)
highlight('Character', gruvboxDarkMode.lightGreen)
highlight('Number', gruvboxDarkMode.lightGreen)
highlight('Boolean', gruvboxDarkMode.lightGreen)
highlight('Float', gruvboxDarkMode.lightGreen)
highlight('SignifySignAdd', gruvboxDarkMode.lightGreen)

highlight('DiagnosticHint', gruvboxDarkMode.lightMagenta)
highlight('Folded', gruvboxDarkMode.lightMagenta)
highlight('FoldColumn', gruvboxDarkMode.lightMagenta)
highlight('LspDiagnosticsDefaultHint', gruvboxDarkMode.lightMagenta)
highlight('Operator', gruvboxDarkMode.lightMagenta)
highlight('SpecialComment', gruvboxDarkMode.lightMagenta)
highlight('Underlined', gruvboxDarkMode.lightMagenta)

highlight('CursorLineNR', gruvboxDarkMode.lightOrange)
highlight('CmpItemAbbrMatch', gruvboxDarkMode.lightOrange)
highlight('Delimiter', gruvboxDarkMode.lightOrange)
highlight('DiagnosticWarn', gruvboxDarkMode.lightOrange)
highlight('LspDiagnosticsDefaultWarning', gruvboxDarkMode.lightOrange)
highlight('SpecialChar', gruvboxDarkMode.lightOrange)
highlight('TelescopeMatching', gruvboxDarkMode.lightOrange)

highlight('DiagnosticError', gruvboxDarkMode.lightRed)
highlight('DiffDelete', gruvboxDarkMode.lightRed)
highlight('diffRemoved', gruvboxDarkMode.lightRed)
highlight('Error', gruvboxDarkMode.lightRed)
highlight('ErrorMsg', gruvboxDarkMode.lightRed)
highlight('LspDiagnosticsDefaultError', gruvboxDarkMode.lightRed)
highlight('SignifySignDelete', gruvboxDarkMode.lightRed)
