require('rawinit')

-- Lazy.nvim config

local lazy = {}

function lazy.install(path)
    if vim.loop.fs_stat(path) then
        return
    end

    print('Installing lazy.nvim....')
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        path,
    })
end

function lazy.setup(plugins)
    if vim.g.plugins_ready then
        return
    end

    -- You can "comment out" the line below after lazy.nvim is installed
    lazy.install(lazy.path)

    vim.opt.rtp:prepend(lazy.path)

    require('lazy').setup(plugins, lazy.opts)
    vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
    { 'tanvirtin/monokai.nvim' },
    { 'nvim-lualine/lualine.nvim' },
    { 'lukas-reineke/indent-blankline.nvim',      main = "ibl",                                                                                                                          opts = {} },
    { 'nvim-treesitter/nvim-treesitter',          build = ':TSUpdate' },
    { 'numToStr/Comment.nvim' },
    { 'tpope/vim-surround' },
    { 'nvim-tree/nvim-tree.lua' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },
    { 'editorconfig/editorconfig-vim' },
    { 'moll/vim-bbye' },
    { 'morhetz/gruvbox' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    {
        'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'wakatime/vim-wakatime',            lazy = false },
    { "catppuccin/nvim",                  name = "catppuccin", priority = 1000 },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
    {
        'ray-x/aurora',
        init = function()
          -- vim.g.aurora_italic = 1
          -- vim.g.aurora_transparent = 1
          vim.g.aurora_bold = 1
        end,
        config = function()
            -- vim.cmd.colorscheme "aurora"
            -- -- override defaults
            -- vim.api.nvim_set_hl(0, '@number', {fg='#e933e3'})
        end
    }
})

-- colorscheme
vim.cmd.colorscheme "catppuccin-mocha"

-- lualine
require('lualine').setup({
    options = { section_separators = '', component_separators = '' }
})

--treesitter
require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
    },
    ensure_installed = {
        'javascript',
        'typescript',
        'html',
        'css',
        'json',
        'lua',
        'python',
        'c',
        'cpp',
        'rust',
        'yaml',
        'toml',
        'kotlin'
    }
})

-- commment
require('Comment').setup()

-- nvim-tree
local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
    view = {
        float = {
            enable = true,
            open_win_config = function()
                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local window_w = screen_w * WIDTH_RATIO
                local window_h = screen_h * HEIGHT_RATIO
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = (screen_w - window_w) / 2
                local center_y = ((vim.opt.lines:get() - window_h) / 2)
                    - vim.opt.cmdheight:get()
                return {
                    border = 'rounded',
                    relative = 'editor',
                    row = center_y,
                    col = center_x,
                    width = window_w_int,
                    height = window_h_int,
                }
            end,
        },
        width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
    },
    filters = {
        dotfiles = false,
        git_ignored = false,
    },
})

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeFindFileToggle<cr>')


-- telescope
vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>,', '<cmd>Telescope oldfiles<cr>')
require('telescope').load_extension('fzf')

-- gitsigns
require('gitsigns').setup({
    signs = {
        add = { text = '+' },
        change = { text = '|' },
        delete = { text = '‾' },
        topdelete = { text = '_' },
        changedelete = { text = '~' },
        untracked = { text = "%" }
    }
})

-- bbye
vim.keymap.set('n', '<leader>k', '<cmd>Bdelete<cr>')



-- LSP Stuff

require('mason').setup()
require('mason-lspconfig').setup()

require('luasnip.loaders.from_vscode').lazy_load()

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.pyright.setup {}
lspconfig.astro.setup {}
-- lspconfig.ccls.setup {
--   init_options = {
--     compilationDatabaseDirectory = "build",
--     index = {
--       threads = 0,
--     },
--     clang = {
--       excludeArgs = { "-frounding-math" },
--     },
--   }
-- }
-- lspconfig.cssls.setup {
--   capabilities = capabilities,
-- }
lspconfig.clangd.setup {}
lspconfig.gopls.setup {}
lspconfig.html.setup {
    capabilities = capabilities,
}
lspconfig.jsonls.setup {
    capabilities = capabilities,
}
lspconfig.jdtls.setup {}
lspconfig.rust_analyzer.setup {
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = false,
            }
        }
    }
}
lspconfig.lua_ls.setup {
    capabilities = capabilities,
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT'
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                            -- "${3rd}/luv/library"
                            -- "${3rd}/busted/library",
                        }
                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                        -- library = vim.api.nvim_get_runtime_file("", true)
                    }
                }
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
    end
}
lspconfig.bashls.setup {}
lspconfig.htmx.setup {
    filetypes = { "html", "templ", "htmldjango", "htmx" }
}
lspconfig.html.setup {
    filetypes = { "html", "templ", "htmldjango", "htmx" }
}
lspconfig.tailwindcss.setup {
    filetypes = { "html", "templ", "htmldjango", "htmx" }
}
lspconfig.tsserver.setup {
    filetypes = { "html", "templ", "htmldjango", "htmx", "js", "jsx", "ts", "tsx" }
}

vim.keymap.set('n', '<leader>x', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>m', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>ta', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>tr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>tl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>fo', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end
})

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
local cmp = require('cmp')
local luasnip = require('luasnip')

require('luasnip.loaders.from_vscode').lazy_load()

local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 2 },
        { name = 'buffer',   keyword_length = 3 },
        { name = 'luasnip',  keyword_length = 2 },
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '@',
                buffer = 'Ω',
                path = '$',
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
        ['<up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<down>'] = cmp.mapping.select_next_item(select_opts),
        -- ['<escape>'] = cmp.mapping.abort(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, { 'i', 's' }),
    },
})

require("nvim-autopairs").setup({})

local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({ name = 'DiagnosticSignError', text = 'X' })
sign({ name = 'DiagnosticSignWarn', text = '!' })
sign({ name = 'DiagnosticSignHint', text = '*' })
sign({ name = 'DiagnosticSignInfo', text = 'i' })

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
    },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = 'rounded' }
)
