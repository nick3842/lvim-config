#!/bin/bash

if ! command -v git &> /dev/null
then
    sudo apt-get update
    sudo apt-get install -y git
fi

if ! command -v curl &> /dev/null
then
    sudo apt-get update
    sudo apt-get install -y curl
fi

sudo apt-get update
sudo apt-get install -y neovim lua5.3 liblua5.3-dev build-essential cmake python3-dev

git clone https://github.com/LunarVim/LunarVim.git ~/.config/lvim

cd ~/.config/lvim
bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/master/utils/installer/install.sh)

curl https://raw.githubusercontent.com/nick3842/lvim-config/main/config.lua > ~/.config/lvim/config.lua
