# My Neovim Config

### Introduction

This is a minimal config designed to run on old spec PCs, but still be able
to achieve IDE like features, like code completion, diagnostics and actions.

This config works best in kitty terminal with Nerd Font Fira Code (or other
nerd fonts).

It also include keybinds of my own likings, like SPC+w for window manipulation
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

I like making it an alias and use it as my manpager as well in my .zshrc
```shell

QVIM="nvim -u '$HOME/.config/nvim/lua/rawinit.lua'"
alias qvim=$QVIM

export MANPAGER="$QVIM +Man!"

```

This config uses the Lazy.nvim package manager.

### Plugins (28 total)

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
