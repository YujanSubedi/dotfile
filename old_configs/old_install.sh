#!/bin/bash

usage() {
	echo "Usage: $0 [-d]"
	exit 1
}

# Default values for flags
default_flag=false

# Parse the arguments
while getopts "d" opt; do
	case ${opt} in
	d)
		default_flag=true
		;;
	\?)
		usage
		;;
	esac
done

# Define color codes (adjust as necessary)
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NONE='\033[0m'

# Define working directory to, come back to.
current_directory=$(pwd)

# Update the Package manager and system
sudo pacman -Syu --noconfirm --needed

# Make time synchronization by NTP
sudo timedatectl set-ntp true

# Cpu microcode
while true; do
	echo -e "${GREEN}Choose the cpu manufacturer${NONE}"
	echo -e "1) AMD ${YELLOW}(Default) ${NONE}"
	echo "2) Intel"
	echo "3) None"
	if [ "$default_flag" = true ]; then
		choice="1"
	else
		read -p "Enter the number of your choice: " choice
		choice=${choice:-1}
	fi
	case $choice in
	1)
		sudo pacman -S --noconfirm --needed amd-ucode
		break
		;;
	2)
		sudo pacman -S --noconfirm --needed intel-ucode
		break
		;;
	3)
		echo "${RED}No Cpu Micro code are installed.${NONE}"
		break
		;;
	*)
		echo -e "\nInvalid selection."
		;;
	esac
done

# Nvidia drivers
while true; do
	echo -e "${GREEN}Install nvidia GPU?${NONE}"
	echo -e "1) Yes with cuda ${YELLOW}(Default) ${NONE}"
	echo "2) Yes"
	echo "3) No"
	if [ "$default_flag" = true ]; then
		choice="1"
	else
		read -p "Enter the number of your choice: " choice
		choice=${choice:-1}
	fi
	case $choice in
	1)
		sudo pacman -S --noconfirm --needed nvidia cuda cudnn
		break
		;;
	2)
		sudo pacman -S --noconfirm --needed nvidia
		break
		;;
	3)
		echo "${RED}Nvidia driver not installed.${NONE}"
		break
		;;
	*)
		echo -e "\nInvalid selection."
		;;
	esac
done

# Install programming languages
sudo pacman -S --noconfirm --needed gcc
# sudo pacman -S --noconfirm --needed ghc
sudo pacman -S --noconfirm --needed lua
sudo pacman -S --noconfirm --needed python
# sudo pacman -S --noconfirm --needed php
# sudo pacman -S --noconfirm --needed perl
# sudo pacman -S --noconfirm --needed yarn
sudo pacman -S --noconfirm --needed npm
sudo pacman -S --noconfirm --needed go
sudo pacman -S --noconfirm --needed rust
# sudo pacman -S --noconfirm --needed octave
# sudo pacman -S --noconfirm --needed iverilog

# C/CPP libraries
sudo pacman -S --noconfirm --needed raylib
sudo pacman -S --noconfirm --needed glew freeglut glu glfw
# sudo pacman -S --noconfirm --needed cmake

# C/CPP Debugger
sudo pacman -S --noconfirm --needed gdb ltrace strace

# SQL
# sudo pacman -S --noconfirm --needed postgresql

# Git
sudo pacman -S --noconfirm --needed git

# Vi, Vim and Neovim
# sudo pacman -S --noconfirm --needed vi vim
sudo pacman -S --noconfirm --needed neovim

# Fonts
sudo pacman -S --noconfirm --needed ttf-jetbrains-mono ttf-jetbrains-mono-nerd
sudo pacman -S --noconfirm --needed noto-fonts
# sudo pacman -S --noconfirm --needed ttf-fira-code

# Neovim dependency
sudo pacman -S --noconfirm --needed ripgrep tar zip unzip

# Emacs
sudo pacman -S --noconfirm --needed emacs

# Enable audio
sudo pacman -S --noconfirm --needed pipewire wireplumber
sudo pacman -S --noconfirm --needed pipewire-pulse pavucontrol

# Bluetooth
# sudo pacman -S --noconfirm --needed bluez-utils bluez

# ntfs and fat suppots
# sudo pacman -S --noconfirm --needed ntfs-3g dosfstools

# usb auto mount
# sudo pacman -S --noconfirm --needed udiskie udisk2

# Printer
# sudo pacman -S --noconfirm --needed cups

# Terminals tools
sudo pacman -S --noconfirm --needed fastfetch htop nvtop
sudo pacman -S --noconfirm --needed fzf ncdu ripgrep-all
sudo pacman -S --noconfirm --needed brightnessctl

# Tmux configuration
sudo pacman -S --noconfirm --needed tmux

# Alacritty Terminal emmulator
sudo pacman -S --noconfirm --needed alacritty

# Latex support, and office
sudo pacman -S --noconfirm --needed texlive
sudo pacman -S --noconfirm --needed libreoffice

# Multimedia
sudo pacman -S --noconfirm --needed vimiv
sudo pacman -S --noconfirm --needed mpv
sudo pacman -S --noconfirm --needed lf ueberzug glow ffmpeg
sudo pacman -S --noconfirm --needed zathura zathura-pdf-mupdf
# sudo pacman -S --noconfirm --needed zathura zathura-pdf-poppler

# Extra Applications
sudo pacman -S --noconfirm --needed discord
sudo pacman -S --noconfirm --needed gimp
# sudo pacman -S --noconfirm --needed spotify-launcher

# cd "$current_directory"

# Grub theme
# sudo pacman -S --noconfirm --needed grub-customizer
# sudo pacman -S --noconfirm --needed os-prober

# Copy basic configs
# cp ./env_variable/.* ~

# Copy configs of application
# cp -r ./.config/ ~

# Tmux configuration
# mkdir -p ~/.config/tmux/
# git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/tpm

# Display Manager
while true; do
	echo -e "${GREEN}Choose Display_manager ${NONE}"
	echo -e "1) None ${YELLOW}(Default) ${NONE}"
	echo "2) Ly"
	echo "3) Lightdm"
	echo "4) Sddm"
	echo "5) Gdm"
	if [ "$default_flag" = true ]; then
		choice="1"
	else
		read -p "Enter the number of your choice: " choice
		choice=${choice:-1}
	fi
	case $choice in
	1)
		echo "${RED}No Display Manager are installed.${NONE}"
		break
		;;
	2)
		sudo pacman -S --noconfirm --needed ly
		# sudo cp ./Display_managers/ly/config.ini /etc/ly/
		sudo systemctl enable ly
		break
		;;
	3)
		sudo pacman -S --noconfirm --needed lightdm lightdm-gtk-greeter
		# sudo pacman -S --noconfirm --needed lightdm-gtk-greeter-settings
		sudo cp ./Display_managers/lightdm/* /etc/lightdm/
		sudo systemctl enable lightdm
		break
		;;
	4)
		sudo pacman -S --noconfirm --needed sddm gt5-graphicaleffects qt5-quickcontrols2
		sudo cp -r ./Display_managers/sddm/Anime /usr/share/sddm/themes
		sudo cp ./Display_managers/sddm/sddm.conf /etc/
		sudo cp ./Display_managers/sddm/.face.icon /usr/share/sddm/faces
		sudo systemctl enable sddm
		break
		;;
	5)
		sudo pacman -S --noconfirm --needed gdm
		sudo systemctl enable gdm
		break
		;;
	*)
		echo -e "\nInvalid selection."
		;;
	esac
done

# To install aur packages
sudo pacman -S --noconfirm --needed base-devel

# Aur Helper
# check if aur_helper is already installed.
aur_helper=$(command -v paru || command -v yay)
# make the command shorter from /bin/paru to paru
aur_helper=$(echo "${aur_helper##*/}")

# if aur helper was not found
if [[ -z "$aur_helper" ]]; then
	while true; do
		echo -e "${GREEN}Choose the Aur Helper ${NONE}"
		echo -e "1) Paru ${YELLOW}(Default) ${NONE}"
		echo "2) Yay"
		echo "3) None"
		if [ "$default_flag" = true ]; then
			choice="1"
		else
			read -p "Enter the number of your choice: " choice
			choice=${choice:-1}
		fi
		case $choice in
		1)
			aur_helper="paru"
			git clone https://aur.archlinux.org/paru-bin/ /tmp/paru
			cd /tmp/paru/
			makepkg -si --noconfirm --needed
			cd $current_directory
			break
			;;
		2)
			aur_helper="yay"
			git clone https://aur.archlinux.org/yay-bin/ /tmp/yay
			cd /tmp/paru/
			makepkg -si --noconfirm --needed
			cd $current_directory
			break
			;;
		3)
			aur_helper="None"
			echo "${RED}No Aur Helper are installed.${NONE}"
			break
			;;
		*)
			echo -e "\nInvalid selection."
			;;
		esac
	done
fi

# Display selected profile
echo -e "${BLUE}"
echo -e "Selected Aur Helper: ${GREEN}$aur_helper"
echo -e "${NONE}"

if [[ $aur_helper == "None" ]]; then
	# git clone https://aur.archlinux.org/brave-bin/ /tmp/brave
	# cd /tmp/brave/
	git clone https://aur.archlinux.org/zen-browser-bin/ /tmp/zen-browser
	cd /tmp/zen-browser/
	makepkg -si --noconfirm --needed
	git clone https://aur.archlinux.org/ctpv/ /tmp/ctpv
	cd /tmp/ctpv/
	makepkg -si --noconfirm --needed
	cd $current_directory
else
	# $aur_helper -S --noconfirm --needed brave-bin
	$aur_helper -S --noconfirm --needed zen-browser-bin
	$aur_helper -S --noconfirm --needed ctpv
fi

# Display selected profile
while true; do
	echo -e "${GREEN}Choose the Display Protocol ${NONE}"
	echo -e "1) Wayland ${YELLOW}(Default) ${NONE}"
	echo "2) X11"
	echo "3) None"
	if [ "$default_flag" = true ]; then
		choice="1"
	else
		read -p "Enter the number of your choice: " choice
		choice=${choice:-1}
	fi
	case $choice in
	1)
		display_protocol="Wayland"
		break
		;;
	2)
		display_protocol="X11"
		break
		;;
	3)
		echo -e "\n${YELLOW}No Display Protocol are implemeted."
		display_protocol="X11"
		break
		;;
	*)
		echo -e "\nInvalid selection."
		;;
	esac
done

# Display selected profile
echo -e "${BLUE}"
echo -e "Selected Display Protocol: ${GREEN}$display_protocol"
echo -e "${NONE}"

# For Wayland
if [[ $display_protocol == "Wayland" ]]; then
	sudo pacman -S --noconfirm --needed wayland wayland-protocols xorg-xwayland
	sudo pacman -S --noconfirm --needed xdg-desktop-portal-hyprland wl-clipboard
	# sudo pacman -S --noconfirm --needed qt6-wayland wlroots
	sudo pacman -S --noconfirm --needed wofi waybar swww
	sudo pacman -S --noconfirm --needed nwg-look
	sudo pacman -S --noconfirm --needed kitty
	cp -r ./Display_protocol/Wayland/* ~/.config/
	while true; do
		echo -e "${GREEN}Choose the Window Manager ${NONE}"
		echo -e "1) Hyprland ${YELLOW}(Default) ${NONE}"
		echo "2) None"
		if [ "$default_flag" = true ]; then
			choice="1"
		else
			read -p "Enter the number of your choice: " choice
			choice=${choice:-1}
		fi
		case $choice in
		1)
			window_manager="Hyprland"
			break
			;;
		2)
			echo -e "\n${YELLOW}No window Manger Installed."
			window_manager="Hyprland"
			break
			;;
		*)
			echo -e "\nInvalid selection."
			;;
		esac
	done

# For X11
elif [[ $display_protocol == "X11" ]]; then
	sudo pacman -S --noconfirm --needed xorg xorg-server
	sudo pacman -S --noconfirm --needed xorg-xinit xclip
	sudo pacman -S --noconfirm --needed picom nitrogen rofi
	sudo pacman -S --noconfirm --needed scrot i3lock arandr
	sudo pacman -S --noconfirm --needed lxappearance
	sudo pacman -S --noconfirm --needed alacritty
	cp -r ./Display_protocol/X11/* ~/.config/
	while true; do
		echo -e "${GREEN}Choose the Window Manager ${NONE}"
		echo -e "1) Xmonad ${YELLOW}(Default) ${NONE}"
		echo "2) Qtile"
		echo "3) Dwm"
		echo "4) None"
		if [ "$default_flag" = true ]; then
			choice="1"
		else
			read -p "Enter the number of your choice: " choice
			choice=${choice:-1}
		fi
		case $choice in
		1)
			window_manager="Xmonad"
			break
			;;
		2)
			window_manager="Qtile"
			break
			;;
		3)
			window_manager="Dwm"
			break
			;;
		4)
			echo -e "\n${YELLOW}No window Manger Installed."
			window_manager="Hyprland"
			break
			;;
		*)
			echo -e "\nInvalid selection."
			;;
		esac
	done
fi

# Display selected profile
echo -e "${BLUE}"
echo -e "Selected Window Manager: ${GREEN}$window_manager"
echo -e "${NONE}"

if [[ $window_manager == "Hyprland" ]]; then
	sudo pacman -S --noconfirm --needed hyprland
	sudo pacman -S --noconfirm --needed hyprlock
	if [[ $aur_helper == "None" ]]; then
		git clone https://aur.archlinux.org/hyprshot/ /tmp/hyprshot
		cd /tmp/hyprshot/
		makepkg -si --noconfirm --needed
		cd $current_directory
	else
		$aur_helper -S --noconfirm --needed hyprshot
	fi
	cp -r ./Window_managers/Hyprland/* ~/.config/

elif [[ $window_manager == "Xmonad" ]]; then
	sudo pacman -S --noconfirm --needed xmonad xmonad-contrib
	# sudo pacman -S --noconfirm --needed xmobar haskell-iwlib
	sudo pacman -S --noconfirm --needed polybar
	cp -r ./Window_managers/Xmonad/* ~/.config/

elif [[ $window_manager == "Qtile" ]]; then
	sudo pacman -S --noconfirm --needed qtile
	sudo pacman -S --noconfirm --needed python-psutil python-iwlib
	cp -r ./Window_managers/Qtile/* ~/.config/

elif [[ $window_manager == "Dwm" ]]; then
	mkdir /tmp/dwm
	cd /tmp/dwm/
	wget https://dl.suckless.org/dwm/dwm-6.5.tar.gz
	tar xvf
	cd dwm-6.5/
	cp "$current_directory"/Window_manager/Dwm/config.h .
	make
	sudo cp dwm /bin/
	cd $current_directory
fi

# Network tools
# while true; do
#     echo -e "${GREEN}Do You want QEMU${NONE}"
#     echo -e "1) Yes ${YELLOW}(Default) ${NONE}"
#     echo "3) No"
#     if [ "$default_flag" = true ]; then
#         choice="1"
#     else
#         read -p "Enter the number of your choice: " choice
#         choice=${choice:-1}
#     fi
#     case $choice in
#         1)
#             sudo pacman -S --noconfirm --needed qemu virt-manager dnsmasq
#             sudo usermod -aG libvirt $(whoami)
#             newgrp libvirt
#             break
#             ;;
#         2)
#                 echo "${RED}Qemu not installed.${NONE}"
#                 break
#                 ;;
#        *)
#                 echo -e "\nInvalid selection."
#                 ;;
#         esac
#     done
# sudo pacman -S --noconfirm --needed inetutils netstat-nat dnsutils net-tools
# sudo pacman -S --noconfirm --needed nmap netcat
# sudo pacman -S --noconfirm --needed network-manager-applet
# sudo pacman -S --noconfirm --needed wireshark
# sudo pacman -S --noconfirm --needed proxychains-ng tor
# sudo pacman -S --noconfirm --needed torbrowser-launcher
# Network tools
sudo pacman -S --noconfirm --needed wget
sudo pacman -S --noconfirm --needed openssl openssh
sudo pacman -S --noconfirm --needed firefox
sudo pacman -S --noconfirm --needed qbittorrent

# Firewall
# while true; do
#     echo -e "${GREEN}Do You want QEMU${NONE}"
#     echo -e "1) Yes ${YELLOW}(Default) ${NONE}"
#     echo "3) No"
#     if [ "$default_flag" = true ]; then
#         choice="1"
#     else
#         read -p "Enter the number of your choice: " choice
#         choice=${choice:-1}
#     fi
#     case $choice in
#         1)
#             sudo pacman -S --noconfirm --needed qemu virt-manager dnsmasq
#             sudo usermod -aG libvirt $(whoami)
#             newgrp libvirt
#             break
#             ;;
#         2)
#                 echo "${RED}Qemu not installed.${NONE}"
#                 break
#                 ;;
#        *)
#                 echo -e "\nInvalid selection."
#                 ;;
#         esac
#     done
# ufw firewall
sudo pacman -S --noconfirm --needed ufw
sudo ufw enable
sudo systemctl enable ufw

# Virtualbox
# sudo pacman -S virtualbox linux-headers

# Virtulization
# while true; do
#     echo -e "${GREEN}Do You want QEMU${NONE}"
#     echo -e "1) Yes ${YELLOW}(Default) ${NONE}"
#     echo "3) No"
#     if [ "$default_flag" = true ]; then
#         choice="1"
#     else
#         read -p "Enter the number of your choice: " choice
#         choice=${choice:-1}
#     fi
#     case $choice in
#         1)
#             sudo pacman -S --noconfirm --needed qemu virt-manager dnsmasq
#             sudo usermod -aG libvirt $(whoami)
#             newgrp libvirt
#             break
#             ;;
#         2)
#                 echo "${RED}Qemu not installed.${NONE}"
#                 break
#                 ;;
#        *)
#                 echo -e "\nInvalid selection."
#                 ;;
#         esac
#     done
# sudo pacman -S --noconfirm --needed docker

# Restart
echo -e "${GREEN}"
echo -e "Succssfully installed : ${RED}$window_manager${NONE}"

echo -e "Do you want to restart"
echo -e "1) Yes ${YELLOW}(Default) ${NONE}"
echo "*) No"
if [ "$default_flag" = true ]; then
	choice="1"
else
	read -p "Enter the number of your choice: " choice
	choice=${choice:-1}
fi
case $choice in
1)
	reboot
	;;
*)
	echo -e "${GREEN} Setup Finised, restart to see result${NONE}"
	;;
esac
