# My Neovim Config

### Introduction

This is my neovim config ^_^
It used to be more lightweight to run on old spec computers but i dont have
that limitaiton anymore, so now it includes a hefty load of plugins for
quality of life and utility.

This config works best in a full color terminal with a patched font selected.

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

### Dependencies

- cmake
- git
- a patched font
- ripgrep
