require('rawinit')

-- Lazy.nvim config

local lazy = {}

function lazy.install(path)
    if vim.loop.fs_stat(path) then
        return
    end

    print('Installing lazy.nvim....')
    vim.fn.system({
        'git', 'clone',
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
    { 'nvim-treesitter/nvim-treesitter',          build = ':TSUpdate' },
    { 'nvim-lualine/lualine.nvim' },
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
    { 'neovim/nvim-lspconfig' },
    { 'wakatime/vim-wakatime',            lazy = false },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
        lazy = false,
    },
    {
        'goolord/alpha-nvim',
        dependencies = {
            'echasnovski/mini.icons',
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.theta'.config)
        end
    },
    { 'norcalli/nvim-colorizer.lua' },
    { "zootedb0t/citruszest.nvim" },
    { "EdenEast/nightfox.nvim" },
    { 'p00f/alabaster.nvim',        priority = 1000,     lazy = false },
    { 'ray-x/aurora' },
    { "bluz71/vim-moonfly-colors",  name = "moonfly",    lazy = false,   priority = 1000 },
    { 'rebelot/kanagawa.nvim' },
    { "ellisonleao/gruvbox.nvim",   priority = 1000,     config = true,  opts = ... },
    { "catppuccin/nvim",            name = "catppuccin", priority = 1000 },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        'maxmx03/fluoromachine.nvim',
        config = function()
            local fm = require 'fluoromachine'

            fm.setup {
                glow = false,
                brightness = 0,
                theme = 'retrowave',
                transparent = false,
            }
        end
    },
    {
  	"folke/tokyonight.nvim",
	 lazy = false,
	 priority = 1000,
	 opts = {},
    },
    { 'justinmk/vim-sneak' },
    { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>XX",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>Xx",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>XL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>XQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
            -- Setup orgmode
            require('orgmode').setup({
                org_agenda_files = '~/orgfiles/**/*',
                org_default_notes_file = '~/orgfiles/refile.org',
            })
        end,
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },
    ---@type LazySpec
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        keys = {
            -- 👇 in this section, choose your own keymappings!
            {
                "<leader>e",
                "<cmd>Yazi<cr>",
                desc = "Open yazi at the current file",
            },
            {
                -- Open in the current working directory
                "<leader>E",
                "<cmd>Yazi cwd<cr>",
                desc = "Open the file manager in nvim's working directory",
            },
            {
                -- NOTE: this requires a version of yazi that includes
                -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
                '<c-up>',
                "<cmd>Yazi toggle<cr>",
                desc = "Resume the last yazi session",
            },
        },
        ---@type YaziConfig
        opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = false,
            keymaps = {
                show_help = '<f1>',
            },
        },
    }
})

local trouble = require("trouble")
local symbols = trouble.statusline({
    mode = "lsp_document_symbols",
    groups = {},
    title = false,
    filter = { range = true },
    format = "{kind_icon}{symbol.name:Normal}",
    -- The following line is needed to fix the background color
    -- Set it to the lualine section you want to use
    hl_group = "lualine_c_normal",
})



-- lualine
require('lualine').setup {
    sections = {
        lualine_c = {
            {
                symbols.get,
                cond = symbols.has
            }
        }
    },
}

-- colorscheme
vim.cmd.colorscheme 'tokyonight-night'

-- disablign netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
        'kotlin',
        'vimdoc',
        'htmldjango',
        'vim',
        'regex',
        'bash',
        'markdown', 'markdown_inline'
    }
})

-- commment
require('Comment').setup()

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
function delete_all_buffers_but_self()
    local r, c = unpack(vim.api.nvim_win_get_cursor(0))
    vim.cmd('%bd|e#')
    vim.api.nvim_win_set_cursor(0, { r, c })
end

vim.keymap.set('n', '<leader>k', '<cmd>Bdelete<cr>')
vim.keymap.set('n', '<leader>K', delete_all_buffers_but_self)

-- snippets
require('luasnip.loaders.from_vscode').lazy_load()
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP Stuff


require('mason').setup()
require('mason-lspconfig').setup()
local lspconfig = require('lspconfig')

function reload_mason_lspconfig()
    require('mason-lspconfig').setup_handlers {
        function(server)
            require('lspconfig')[server].setup {
                capabilities = capabilities,
            }
        end,

        ['lua_ls'] = function()
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
        end,

        ['rust_analyzer'] = function()
            lspconfig.rust_analyzer.setup {
                settings = {
                    ["rust-analyzer"] = {
                        imports = {
                            granularity = {
                                group = "module",
                            },
                            prefix = "self",
                        },
                        cargo = {
                            buildScripts = {
                                enable = true,
                                overrideCommand = vim.g.rust_analyzer_cmd
                            },
                            allFeatures = true,
                            allTargets = true,
                        },
                        procMacro = {
                            enable = true
                        },
                        checkOnSave = {
                            allFeatures = true,
                            allTargets = true,
                        },
                        check = {
                            overrideCommand = vim.g.rust_analyzer_cmd
                        }
                    }
                }
            }
        end,

        ['jinja_lsp'] = function()
            lspconfig.jinja_lsp.setup {
                filetypes = { 'html', 'htmldjango', 'templ' }
            }
        end,

        ['htmx'] = function()
            lspconfig.htmx.setup {
                filetypes = { 'html', 'htmldjango', 'templ' }
            }
        end,

        ['html'] = function()
            lspconfig.html.setup {
                filetypes = { 'html', 'htmldjango', 'templ' }
            }
        end,

        ['emmet_language_server'] = function()
            lspconfig.emmet_language_server.setup {
                filetypes = { 'html', 'htmldjango', 'templ', 'typescriptreact' }
            }
        end,
    }
end

reload_mason_lspconfig()

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
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>ta', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>tr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>tl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        -- vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, opts)
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
        { name = 'nvim_lsp', keyword_length = 3 },
        { name = 'buffer',   keyword_length = 2 },
        { name = 'luasnip',  keyword_length = 1 },
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

require 'colorizer'.setup()

local bufferline = require("bufferline")
bufferline.setup {
    options = {
        mode = "tabs",
        hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' }
        },
        numbers = "ordinal",
        separator_style = "slope",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. " " .. count
        end,
        indicator = {
            style = "underline"
        }
    }
}

vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<CR>')
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<CR>')

function bl_goto(num)
    return function()
        bufferline.go_to(num, true)
    end
end

vim.keymap.set('n', '<leader>1', bl_goto(1))
vim.keymap.set('n', '<leader>2', bl_goto(2))
vim.keymap.set('n', '<leader>3', bl_goto(3))
vim.keymap.set('n', '<leader>4', bl_goto(4))
vim.keymap.set('n', '<leader>5', bl_goto(5))
vim.keymap.set('n', '<leader>6', bl_goto(6))
vim.keymap.set('n', '<leader>7', bl_goto(7))
vim.keymap.set('n', '<leader>8', bl_goto(8))
vim.keymap.set('n', '<leader>9', bl_goto(9))
vim.keymap.set('n', '<leader>$', bl_goto(-1))

vim.keymap.set('n', '<leader>t1', '<cmd>tabmove 0<CR>')
vim.keymap.set('n', '<leader>t2', '<cmd>tabmove 1<CR>')
vim.keymap.set('n', '<leader>t3', '<cmd>tabmove 2<CR>')
vim.keymap.set('n', '<leader>t4', '<cmd>tabmove 3<CR>')
vim.keymap.set('n', '<leader>t5', '<cmd>tabmove 4<CR>')
vim.keymap.set('n', '<leader>t6', '<cmd>tabmove 5<CR>')
vim.keymap.set('n', '<leader>t7', '<cmd>tabmove 6<CR>')
vim.keymap.set('n', '<leader>t8', '<cmd>tabmove 7<CR>')
vim.keymap.set('n', '<leader>t9', '<cmd>tabmove 8<CR>')


vim.keymap.set('n', '<leader>tj', '<cmd>tabmove -<CR>')
vim.keymap.set('n', '<leader>tk', '<cmd>tabmove +<CR>')

require('todo-comments').setup {}
