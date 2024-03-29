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

### Plugins (31 total)

- folke/tokyonight.nvim
- tanvirtin/monokai.nvim
- nvim-lualine/lualine.nvim
- lukas-reineke/indent-blankline.nvim
- nvim-treesitter/nvim-treesitter
- numToStr/Comment.nvim
- tpope/vim-surround
- nvim-tree/nvim-tree
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
- L3MON4D3/LuaSnip
- hrsh7th/cmp-nvim-lsp
- williamboman/mason.nvim
- williamboman/mason-lspconfig.nvim
- wakatime/vim-wakatime
- whatyouhide/vim-gotham
- maxmx03/fluoromachine.nvim
- liuchengxu/space-vim-theme
- catppuccin/nvim
- nvim-autopairs

### Added Colorschemes

- tokyonight
- monokai
- cyberpunk
- gruvbox
- space-vim-theme
- fluoromachine
- catppuccin

### Screenshots

![image](https://github.com/atomoxetine/nvim/assets/132525922/c960252a-cbdf-47a3-8797-e7231502473a)
![image](https://github.com/atomoxetine/nvim/assets/132525922/d1fc80be-b6b4-498e-9fab-476a40515d94)
![image](https://github.com/atomoxetine/nvim/assets/132525922/c3feef2d-5446-4d32-a090-931bec023f30)
![image](https://github.com/atomoxetine/nvim/assets/132525922/4f7637af-8617-4623-a8f6-a1e29fad7432)
![image](https://github.com/atomoxetine/nvim/assets/132525922/4dd3f148-fe56-4379-b425-234cd9d7da94)


### Dependencies

- cmake
- git
- a patched font
