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
-- vim.opt.cursorline = true


-- netrw settings
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 1
vim.g.netrw_browse_split = 4
vim.g.netrw_keepdir = 0


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

-- netrw
vim.keymap.set('n', '<leader>e', ':Lexplore!<cr>')

-- window manipulation emacs style :sunglasses:
vim.keymap.set('n', '<leader>w', '')

-- kill buffer
vim.keymap.set('n', '<leader>k', ':bd<cr>')

local function getColorschemeIdx(colorscheme)
    local colorschemeList = vim.fn.getcompletion("", "color")

    for k,v in ipairs(colorschemeList) do
        if v == colorscheme then
            return k
        end
    end

    return nil
end

vim.g.colors_idx = 0


-- This is needed since vim does not account for colorschemes with dashes '-' in their names
-- e.g. when the colorscheme is tokyonight-storm and you run 'echo g:colors_name',
-- the output is just tokyonight, freezing the colorscheme cycler
--
-- Altough for some reason sometimes the current colorscheme is not
-- printed when changed
vim.api.nvim_create_autocmd({"ColorScheme"}, {
    callback = function(args)
        vim.g.colors_idx = getColorschemeIdx(args.match)
        print("Changed colorscheme to " .. args.match)
    end
})

vim.keymap.set('n', '<F2>', function ()
    local colorschemeList = vim.fn.getcompletion("", "color")
    local idx = vim.g.colors_idx

    local prev

    if idx > 1 then
        idx = idx - 1
    else
        idx = #colorschemeList
    end

    prev = colorschemeList[idx]
    vim.g.colors_idx = idx

    vim.cmd.colorscheme(prev)
end)

vim.keymap.set('n', '<F3>', function ()
    local colorschemeList = vim.fn.getcompletion("", "color")
    local idx = vim.g.colors_idx

    local next

    if idx < #colorschemeList then
        idx = idx + 1
    else
        idx = 1
    end

    next = colorschemeList[idx]
    vim.g.colors_idx = idx

    vim.cmd.colorscheme(next)
end)

vim.opt.termguicolors = true

return {}
