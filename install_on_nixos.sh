#!/bin/sh

# Copy the .bashrc, .inputrc, .vimrc, for configurion bash and vim
cp .bashrc ~
cp .inputrc ~
cp .vimrc ~

# For startx
# cp .xinitrc ~

# To auto startx on tty1
# cp .bash_profile ~

# copy the configuration of xmonad, qtile, polybar, picom, neovim, rofi, default 
cp -r .config ~

# copy sddm and grub themes to the /usr/ folder
sudo mkdir -p /usr/sddm/faces /usr/sddm/themes /usr/grub/themes
sudo cp sddm_theme/.face.icon /usr/sddm/faces
sudo cp -r grub_theme/DanHeng /usr/grub/themes/
sudo cp -r sddm_theme/Anime /usr/sddm/themes/

# copy the nixos configuration for grub, sddm, and give the nixos packages
sudo cp nix_configuration/configuration.nix /etc/nixos/

# Neovim Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# build the new nix packages
sudo nix-rebuild switch && reboot
