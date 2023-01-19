# My dotfiles

**warning**: Please do now not use settings if you have no idea what it contains. Use at your own risk!!

## contents

 - Neovim config
 - Zsh config
 - tmux config
 - install script (install.sh)


## Neovim setup
This uses [neovim](https://neovim.io) version 0.8 and higher

my neovim config uses various plugins to make my workflow smooth

Plugins that i use:
    * [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) - Plugin manager
    * [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - use to set statusline

## what i use to customize and work effectively in shell

 - [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) - Powerline patch fonts. I use meslo font
 - [zsh](https://www.zsh.org/) -i use the zsh shell because it is flexible and highly customizable
 - [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) -i use to oh-my-zsh to customize shell
 - [z](https://github.com/rupa/z) -i use z to jump around in shell
 - [tmux](https://tmux.github.io/) -i use tmux because it is very flexible and it helps to get work done fast. tmux spit a single window into multiple panes, enabling users to run multiple commands and processes at the same time. This can greatly increase productivity, as users are able to work on multiple tasks and projects simultaneously

## Installation

I create a simple bash script (install.sh) to install all packages that i use to setup my work environment, this script automatically configure all settings to neovim, tmux, zsh and everything that i use.

Note that this script is very messy and as i just learn bash and thought this was a good little project to do so i wouldn't reccommend using it. If you look it over and decides to use it. Use at you own risk.

## how to use this config

clone this repo using
---
    git clone https://github.com/yahoo100kkk/dotfiles.git
---

After cloning the repo run the install script and it should automatically install 
---
    ./install.sh
---
### What this script will install
    
    * Neovim
    * tmux
    * zsh
    * oh-my-zsh
    * unzip
    * gzip

## folder stucture
___
|____install.sh
|____nvim
| | |__init.lua 
| | |__lua
| | | |___colorscheme-config.lua
| | | |___comment.lua
| | | |___lsp-config.lua
| | | |___lualine-config.lua
| | | |___mappings.lua
| | | |___plugin_install.lua
| | | |___settings.lua
| | | |___snippets.lua
| | | |___tree-config.lua
| | | |___treesitter-config.lua
|____README.md
|____tmux
| |____.tmux.conf
|____zsh
| |____.zshrc
___

