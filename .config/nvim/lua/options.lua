local globalOptions = vim.o
local windowLocalOptions = vim.wo
local bufferLocalOptions = vim.bo

globalOptions.autowrite = true
globalOptions.background = 'dark'
globalOptions.backup = false
globalOptions.clipboard = 'unnamedplus'
globalOptions.completeopt = 'menuone,noinsert,noselect'
globalOptions.colorcolumn = '128'
globalOptions.ignorecase = true
globalOptions.hlsearch = false
globalOptions.scrolloff = 2
globalOptions.showmode = false
globalOptions.smartcase = true
globalOptions.splitbelow = true
globalOptions.splitright = true
globalOptions.termguicolors = true
globalOptions.updatetime = 64
globalOptions.writebackup = false

windowLocalOptions.cursorline = true
windowLocalOptions.number = true
windowLocalOptions.relativenumber = true
windowLocalOptions.signcolumn = 'yes'

bufferLocalOptions.expandtab = true
bufferLocalOptions.shiftwidth = 2
bufferLocalOptions.swapfile = false
bufferLocalOptions.tabstop = 2