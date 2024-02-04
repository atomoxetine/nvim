# My Neovim Config

### Introduction

This is a minimal config designed to run on old spec PCs, but still being able
to achieve IDE like features, like code completion, diagnostics and actions.

This config works best in kitty terminal with Nerd Font Fira Code (or other
nerd fonts).

It also includes keybinds of my own likings, like SPC+w for window manipulation
instead of C-w and SPC+p, SPC+y, SPC+d for saving to system clipboard (plus),
the usual p, y, d for saving to neovim clipboard registers (unnamed) and SPC+e
to open the file explorer (Lexplore or Nvim-Tree).

It also includes a "barebones" mode with no plugins and only a few simple
configs and keybinds for really fast startup time and performance if you just
want to make a quick edit, the config file is located at lua/rawinit.lua and
you can launch this mode using the shell command:

```shell
nvim -u '$HOME/.config/nvim/lua/rawinit.lua'
```

I also like making it an alias
```shell

QVIM="nvim -u '$HOME/.config/nvim/lua/rawinit.lua'"
alias qvim=$QVIM

```

This config uses the Lazy.nvim plugin manager.

### Plugins (29 total)

- folke/tokyonight.nvim
- tanvirtin/monokai.nvim
- nvim-lualine/lualine.nvim
- lukas-reineke/indent-blankline.nvim
- nvim-treesitter/nvim-treesitter
- numToStr/Comment.nvim
- tpope/vim-surround
- nvim-tree/nvim-web-devicons
- nvim-lua/plenary.nvim
- nvim-telescope/telescope.nvim
- nvim-telescope/telescope-fzf-native.nvim
- tpope/vim-fugitive
- lewis6991/gitsigns.nvim
- editorconfig/editorconfig.vim
- moll/vim-bbye
- thedenisnikulin/vim-cyberpunk
- morhetz/gruvbox
- neovim/nvim-lspconfig
- hrsh7th/nvim-cmp
- hrsh7th/cmp-buffer
- saddparwaiz1/cmp_luasnip
- hrsh7th/cmp-nvim-lsp
- williamboman/mason.nvim
- williamboman/mason-lspconfig.nvim
- wakatime/vim-wakatime

### Added Colorschemes

- tokyonight
- monokai
- cyberpunk
- gruvbox

### Screenshots

![image](https://github.com/atomoxetine/nvim/assets/132525922/8e2c6c48-6b6d-44f6-adfd-47a099d5a6c3)


### Dependencies

- cmake
- git
- a patched font
