#!/usr/bin/bash

# update #
sudo pacman -Syu --noconfirm


# terminal #
sudo pacman -S --noconfirm alacritty
# terminal multiplexer #
sudo pacman -S --noconfirm tmux


# bash config #
cp .bashrc ~
cp .inputrc ~

# gcc #
# sudo pacman -S --noconfirm gcc

# vi, vim if not installed by default #
# sudo pacman -S --noconfirm vi vim
cp .vimrc ~

# neovim and dependency #
sudo pacman -S --noconfirm neovim
sudo pacman -S --noconfirm tar unzip npm xclip

# packer for nvim #
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim


# for AUR support #
sudo pacman -S --noconfirm base-devel

# ssh #
sudo pacman -S --noconfirm openssh

# ufw firewall #
sudo pacman -S --noconfirm ufw
sudo ufw enable
sudo systemctl enable ufw

# ntfs and fat supports #
sudo pacman -S --noconfirm ntfs-3g
sudo pacman -S --noconfirm dosfstools

# usb auto mount #
# sudo pacman -S --noconfirm udiskie udisk2


# GUI for linux, X server #
sudo pacman -S --noconfirm xorg xorg-server


# qtile and dependency #
sudo pacman -S --noconfirm qtile
sudo pacman -S --noconfirm scrot brightnessctl rofi i3lock
sudo pacman -S --noconfirm nitrogen python-psutil picom
sudo pacman -S --noconfirm noto-fonts ttf-noto-nerd 

# copy the config files of alacritty, nvim, qtile, picom, rofi, lf #
cp -r .config ~


# terminal tools #
sudo pacman -S --noconfirm neofetch htop ncdu fzf cmatrix

# for "locate" cmd #
# sudo pacman -S --noconfirm mlocate
# sudo updatedb


# audio and network tools #
sudo pacman -S --noconfirm pulseaudio alsa-utils pavucontrol
# sudo pacman -S --noconfirm network-manager-applet


# file managers and file loader #
sudo pacman -S --noconfirm lf ueberzug glow ffmpegthumbnailer

# img viewer, video player, calculator, document editor #
sudo pacman -S --noconfirm calc 
sudo pacman -S --noconfirm sxiv 
sudo pacman -S --noconfirm mpv 
sudo pacman -S --noconfirm zathura zathura-pdf-mupdf 
# sudo pacman -S --noconfirm libreoffice

# gimp, blender #
# sudo pacman -S --noconfirm gimp
# sudo pacman -S --noconfirm blender

# gui based multimonitor and theme changer #
sudo pacman -S --noconfirm arandr lxappearance

# themes #
sudo pacman -S --noconfirm papirus-icon-theme arc-gtk-theme
cp -r Pictures ~


# browser and discord #
sudo pacman -S --noconfirm firefox 
# sudo pacman -S --noconfirm discord

#  docker #
# sudo pacman -S --noconfirm docker

# tor browser and qbittorrent #
# sudo pacman -S --noconfirm torbrowser-launcher
# sudo pacman -S --noconfirm qbittorrent

# virtualbox #
# sudo pacman -S --noconfirm virtualbox linux-headers


# sddm and dependency #
sudo pacman -S --noconfirm sddm
sudo pacman -S --noconfirm qt5-graphicaleffects qt5-quickcontrols2
sudo cp -r sddm_theme/Anime /usr/share/sddm/themes
sudo cp sddm_theme/sddm.conf /etc/
sudo cp sddm_theme/.face.icon /usr/share/sddm/faces
sudo systemctl enable sddm


# grub #
sudo pacman -S --noconfirm grub-customizer
sudo cp -r grub_theme/DanHeng /boot/grub/themes


# nvidia support #
# sudo pacman -S --noconfirm nvidia nvidia-settings
# cuda support #
# sudo pacman -S --noconfirm cuda
 
# amd support #
# sudo pacman -S --noconfirm amd-ucode

# intel support #
# sudo pacman -S --noconfirm intel-ucode


# to install paru #
# git clone https://aur.archlinux.org/paru.git
# cd paru
# makepkg -si --noconfirm 
# cd ..

# to install yay #
# git clone https://aur.archlinux.org/yay-git.git
# cd yay-git
# makepkg -si --noconfirm 
# cd ..

# for lf depedency #
# paru -S --noconfirm ctpv

# librewolf #
# paru -S --noconfirm librewolf-bin

# brave browser #
# paru -S --noconfirm brave-bin

# vscode #
# sudo pacman -S --noconfirm code

# vscode microsoft #
# paru -S --noconfirm visual-studio-code-bin

# vscodium #
# paru -S --noconfirm vscodium-bin


reboot
