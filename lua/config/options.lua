vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- turn on line numbers
vim.cmd("set number")

-- no line wrapping
vim.cmd("set nowrap")

-- new split windows should be on the right or bottom
vim.cmd("set splitright")
vim.cmd("set splitbelow")

-- explicitly map yank operations to system clipboard
vim.keymap.set('n', 'y', '"+y', { noremap = true })
vim.keymap.set('n', 'Y', '"+Y', { noremap = true })
vim.keymap.set('v', 'y', '"+y', { noremap = true })

vim.g.mapleader = " "
