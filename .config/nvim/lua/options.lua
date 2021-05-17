local command = vim.api.nvim_command
local globalOptions = vim.o
local windowLocalOptions = vim.wo
local bufferLocalOptions = vim.bo

command('filetype on')
command('syntax on')

globalOptions.background = 'dark'
globalOptions.backup = false
globalOptions.clipboard = 'unnamedplus'
globalOptions.completeopt = 'menuone,noinsert,noselect,longest'
globalOptions.ignorecase = true
globalOptions.hlsearch = false
globalOptions.lazyredraw = true
globalOptions.scrolloff = 2
globalOptions.showmode = false
globalOptions.smartcase = true
globalOptions.splitbelow = true
globalOptions.splitright = true
globalOptions.termguicolors = true
globalOptions.updatetime = 64
globalOptions.writebackup = false

windowLocalOptions.number = true
windowLocalOptions.relativenumber = true
windowLocalOptions.signcolumn = 'yes'
windowLocalOptions.wrap = true

bufferLocalOptions.expandtab = true
bufferLocalOptions.shiftwidth = 2
bufferLocalOptions.swapfile = false
bufferLocalOptions.tabstop = 2
