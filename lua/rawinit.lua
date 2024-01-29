-- General Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.cc = '80'
vim.opt.expandtab = true
vim.opt.clipboard = 'unnamed'


-- netrw settings
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20


-- Keymaps
vim.g.mapleader = ' '

-- clipboard stuff
vim.keymap.set({'n', 'x'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'x'}, '<leader>p', '"+p')
vim.keymap.set({'n', 'x'}, '<leader>d', '"+d')

-- disable saving to register when using x to delete
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'x'}, 'X', '"_d')

-- select all text in current buffer
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- open file explorer
vim.keymap.set('n', '<leader>e', ':Lexplore<cr>')

-- window manipulation emacs style :sunglasses:
vim.keymap.set('n', '<leader>w', '')

-- kill buffer
vim.keymap.set('n', '<leader>k', ':bd<cr>')

-- add double quotes, parenthesis, etc
vim.keymap.set('i', '"', '""<left>')
vim.keymap.set('i', '(', '()<left>')
vim.keymap.set('i', '[', '[]<left>')
vim.keymap.set('i', '{', '{}<left>')
vim.keymap.set('i', '""', '""')
vim.keymap.set('i', '()', '()')
vim.keymap.set('i', '[]', '[]')
vim.keymap.set('i', '{}', '{}')
vim.keymap.set('i', '"<backspace>', '"')
vim.keymap.set('i', '(<backspace>', '(')
vim.keymap.set('i', '[<backspace>', '[')
vim.keymap.set('i', '{<backspace>', '{')
vim.keymap.set('i', '"<space>', '"  "<left><left>')
vim.keymap.set('i', '(<space>', '(  )<left><left>')
vim.keymap.set('i', '[<space>', '[  ]<left><left>')
vim.keymap.set('i', '{<space>', '{  }<left><left>')
-- vim.keymap.set('i', '"<cr>', '"<cr><cr>"<up><tab>')
-- vim.keymap.set('i', '(<cr>', '(<cr><cr>)<up><tab>')
-- vim.keymap.set('i', '[<cr>', '[<cr><cr>]<up><tab>')
-- vim.keymap.set('i', '{<cr>', '{<cr><cr>}<up><tab>')

vim.keymap.set('n', '<space>cs', ':colorscheme<space>')

return {}


