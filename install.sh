#!/bin/bash

usage() {
	echo "Run $0 without options or with [-d]"
	echo "[-d] : sets defaults values."
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

if [[ "$1" == "default" ]] || [[ "$1" == "d" ]]; then
	default_flag=true
fi

# Define color codes (adjust as necessary)
RED='\033[0;31m'
BLUE='\033[0;36m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NONE='\033[0m'

# Abort in Ctrl + C
trap exit SIGINT

# Default value
if [[ "$default_flag" == true ]]; then
	cpu_architecture=AMD                         # AMD Intel NONE
	graphic_driver=NONE                          # Nvidia Nvidia_with_Cuda NONE
	display_manager=NONE                         # NONE Ly Lightdm Sddm Gdm
	display_protocol=Wayland                     # Wayland Xorg NONE
	window_manager=Niri                          # Niri Hyprland Xmonad Qtile NONE
	aur_helper=paru                              # paru yay
	Virtualization=(Docker)                      # Qemu Docker Virt_Manager Waydroid
	Network_tools=(Qbit_Torrent Yt_Dlp Sniffnet) # Tor_Proxy Qbit_Torrent Yt_Dlp Sniffnet Wireshark Burpsuite
	Browsers=(Zen_Browser Tor_Browser)           # Zen_Browser Firefox Ungoogled_Chromium Tor_Browser QuteBrowser Vivaldi Brave_Browser Librewolf
	Extra_applications=(Gimp)                    # Discord Gimp Openshot LibreOffice Texlive Spotify LocalSend
	Copy_configs=No                              # Yes No
	firewall=Yes                                 # Yes No
	Restart_flag=No                              # Yes No

else # Let user select
	# Cpu MicroCode
	echo "Cpu Architecture:"
	select cpu_architecture in AMD Intel NONE; do
		case $REPLY in
		1 | 2 | 3)
			break
			;;
		*)
			echo "Invalid Selection!"
			echo "Give the Cpu architecture: 1) AMD, 2) Intel, 3) NONE"
			;;
		esac
	done
	echo -e "${BLUE}Cpu Architecture: ${YELLOW}$cpu_architecture${NONE}"

	# Graphic Driver
	echo "Graphic Driver:"
	select graphic_driver in Nvidia Nvidia_with_Cuda NONE; do
		case $REPLY in
		1 | 2 | 3)
			break
			;;
		*)
			echo "Invalid Selection"
			;;
		esac
	done
	echo -e "${BLUE}Graphic Driver: ${YELLOW}$graphic_driver${NONE}"

	echo "Display Manager:"
	select display_manager in NONE Ly Lightdm Sddm Gdm; do
		case $REPLY in
		1 | 2 | 3 | 4 | 5)
			break
			;;
		*)
			echo "Invalid Selection"
			;;
		esac
	done
	echo -e "${GREEN}Display Manager: ${YELLOW}$display_manager${NONE}"

	echo "Display Manager:"
	select display_protocol in Wayland Xorg NONE; do
		case $REPLY in
		0 | 1 | 2 | 3)
			break
			;;
		*)
			echo "Invalid Selection"
			;;
		esac
	done
	echo -e "${GREEN}Display Protocol: ${YELLOW}$display_protocol${NONE}"

	case $display_protocol in # Wayland Xorg NONE
	Wayland)
		echo "Window Manager:"
		select window_manager in Niri Hyprland NONE; do
			case $REPLY in
			1 | 2 | 3)
				break
				;;
			*)
				echo "Invalid Selection"
				;;
			esac
		done
		;;
	Xorg)
		echo "Window Manager:"
		select window_manager in Qtile Xmonad NONE; do
			case $REPLY in
			1 | 2 | 3)
				break
				;;
			*)
				echo "Invalid Selection"
				;;
			esac
		done
		;;
	*) ;;
	esac
	echo -e "${GREEN}Window Manager: ${YELLOW}$window_manager${NONE}"

	echo "Aur Helper"
	select aur_helper in paru yay; do
		case $REPLY in
		1 | 2)
			break
			;;
		*)
			echo "Invalid Selection"
			;;
		esac
	done
	echo -e "${BLUE}Aur Helper: ${YELLOW}$aur_helper${NONE}"

	echo "Virtualization: Multiple options can be selected selperated by space."
	options=(ALL Qemu Docker Virt_Manager)
	Virtualization=()
	for i in "${!options[@]}"; do
		echo "$i) ${options[$i]}"
	done
	read -r initial_choices
	read -ra processed_choices <<<"$(echo "$initial_choices" | tr " " "\n" | sort -n | uniq | tr "\n" " ")"
	for choise in "${processed_choices[@]}"; do
		case $choise in
		0)
			Virtualization=(Qemu Docker Virt_Manager Waydroid)
			break
			;;
		1 | 2 | 3 | 4)
			Virtualization+=("${options[$choise]}")
			;;
		*) ;;
		esac
	done
	echo -e "${BLUE}Virtualization: ${YELLOW}${Virtualization[*]}${NONE}"

	echo "Network Tools: Multiple options can be selected selperated by space."
	options=(ALL Tor_Proxy Qbit_Torrent Yt_Dlp Sniffnet Wireshark Burpsuite)
	Network_tools=()
	for i in "${!options[@]}"; do
		echo "$i) ${options[$i]}"
	done
	read -r initial_choices
	read -ra processed_choices <<<"$(echo "$initial_choices" | tr " " "\n" | sort -n | uniq | tr "\n" " ")"
	for choise in "${processed_choices[@]}"; do
		case $choise in
		0)
			Network_tools=(Tor_Proxy Qbit_Torrent Yt_Dlp Sniffnet Wireshark Burpsuite)
			break
			;;
		1 | 2 | 3 | 4 | 5)
			Network_tools+=("${options[$choise]}")
			;;
		*) ;;
		esac
	done
	echo -e "${BLUE}Network Tools: ${YELLOW}${Network_tools[*]}${NONE}"

	echo "Browsers: Multiple options can be selected selperated by space."
	options=(ZenChromium Zen_Browser Firefox Ungoogled_Chromium Tor_Browser Vivaldi QuteBrowser Brave_Browser Librewolf)
	Browsers=()
	for i in "${!options[@]}"; do
		echo "$i) ${options[$i]}"
	done
	read -r initial_choices
	read -ra processed_choices <<<"$(echo "$initial_choices" | tr " " "\n" | sort -n | uniq | tr "\n" " ")"
	for choise in "${processed_choices[@]}"; do
		case $choise in
		0)
			Browsers=(Zen_Browser Ungoogled_Chromium)
			break
			;;
		1 | 2 | 3 | 4 | 5 | 6 | 7 | 8)
			Browsers+=("${options[$choise]}")
			;;
		*) ;;
		esac
	done
	echo -e "${BLUE}Browsers: ${YELLOW}${Browsers[*]}${NONE}"

	echo "Extra Applications: Multiple options can be selected selperated by space."
	options=(ALL Discord Gimp Openshot LibreOffice Texlive Spotify LocalSend)
	Extra_applications=()
	for i in "${!options[@]}"; do
		echo "$i) ${options[$i]}"
	done
	read -r initial_choices
	read -ra processed_choices <<<"$(echo "$initial_choices" | tr " " "\n" | sort -n | uniq | tr "\n" " ")"
	for choise in "${processed_choices[@]}"; do
		case $choise in
		0)
			Extra_applications=(Discord Gimp Openshot LibreOffice Texlive Spotify LocalSend)
			break
			;;
		1 | 2 | 3 | 4 | 5 | 6 | 7)
			Extra_applications+=("${options[$choise]}")
			;;
		*) ;;
		esac
	done
	echo -e "${BLUE}Extra Applications: ${YELLOW}${Extra_applications[*]}${NONE}"

	echo "Copy Configs?"
	select Copy_configs in Yes No; do
		case $REPLY in
		1 | 2)
			break
			;;
		*)
			echo "Invalid Selection"
			;;
		esac
	done
	echo -e "${RED}Copy Configs: ${YELLOW}$Copy_configs${NONE}"

	echo "Setup Uncomplicated Firewall (ufw)"
	select firewall in Yes No; do
		case $REPLY in
		1 | 2)
			break
			;;
		*)
			echo "Invalid Selection"
			;;
		esac
	done
	echo -e "${RED}Setup Firewall: ${YELLOW}$firewall${NONE}"

	echo "Restart after completion?"
	select Restart_flag in Yes No; do
		case $REPLY in
		1 | 2)
			break
			;;
		*)
			echo "Invalid Selection"
			;;
		esac
	done
	echo -e "${GREEN}Restart: ${YELLOW}$Restart_flag${NONE}"
fi

echo ""
echo "Summery:"
echo -e "${BLUE}Cpu Architecture: ${YELLOW}$cpu_architecture${NONE}"
echo -e "${BLUE}Graphic Driver: ${YELLOW}$graphic_driver${NONE}"
echo -e "${GREEN}Display Manager: ${YELLOW}$display_manager${NONE}"
echo -e "${GREEN}Display Protocol: ${YELLOW}$display_protocol${NONE}"
echo -e "${GREEN}Window Manager: ${YELLOW}$window_manager${NONE}"
echo -e "${BLUE}Aur Helper: ${YELLOW}$aur_helper${NONE}"
echo -e "${BLUE}Virtualization: ${YELLOW}${Virtualization[*]}${NONE}"
echo -e "${BLUE}Network Tools: ${YELLOW}${Network_tools[*]}${NONE}"
echo -e "${BLUE}Browsers: ${YELLOW}${Browsers[*]}${NONE}"
echo -e "${BLUE}Extra Applications: ${YELLOW}${Extra_applications[*]}${NONE}"
echo -e "${RED}Copy Configs: ${YELLOW}$Copy_configs${NONE}"
echo -e "${RED}Setup Firewall: ${YELLOW}$firewall${NONE}"
echo -e "${GREEN}Restart: ${YELLOW}$Restart_flag${NONE}"

echo ""
echo "Proceed or Abort"
select _ in Proceed Abort; do
	case $REPLY in
	1)
		echo -e "${GREEN}Starting Installation!${NONE}"
		break
		;;
	*)
		echo -e "${RED}Installation Aborted!${NONE}"
		exit 130
		;;
	esac
done

# Start of Installation

# Update the Package manager
sudo pacman -Sy --noconfirm
sudo pacman -Fy --noconfirm

# C, Cpp, Rust
sudo pacman -S --noconfirm --needed gcc
sudo pacman -S --noconfirm --needed rustup
rustup default stable
sudo pacman -S --noconfirm --needed clang
# sudo pacman -S --noconfirm --needed rust

# Vi, Vim and Neovim
# sudo pacman -S --noconfirm --needed vi vim
sudo pacman -S --noconfirm --needed neovim

# Git and networking tools
sudo pacman -S --noconfirm --needed git
sudo pacman -S --noconfirm --needed openssh nmap
sudo pacman -S --noconfirm --needed wget xh

# Networking Tools - dig, nslookup, arp, netstat, telnet
# sudo pacman -S --noconfirm --needed bind
# sudo pacman -S --noconfirm --needed net-tools inetutils gnu-netcat

# Compression and decompression
sudo pacman -S --noconfirm --needed tar zip unzip 7zip

# Fonts
sudo pacman -S --noconfirm --needed noto-fonts noto-fonts-emoji noto-fonts-cjk
sudo pacman -S --noconfirm --needed ttf-jetbrains-mono ttf-jetbrains-mono-nerd

# To install Aur Packages
sudo pacman -S --noconfirm --needed base-devel

# Aur Helper
case $aur_helper in # paru yay
paru)
	if ! command -v paru &>/dev/null; then
		# git clone https://aur.archlinux.org/paru-git/ /tmp/paru
		git clone https://aur.archlinux.org/paru-bin/ /tmp/paru
		makepkg -si --noconfirm --needed -D /tmp/paru
	fi
	;;
yay)
	if ! command -v yay &>/dev/null; then
		# git clone https://aur.archlinux.org/yay-git/ /tmp/yay
		git clone https://aur.archlinux.org/yay-bin/ /tmp/yay
		makepkg -si --noconfirm --needed -D /tmp/yay
	fi
	;;
*) ;;
esac

# Update aur_helper
$aur_helper -Sy

# Downgrade packages rollback for broken packages
# $aur_helper -S --noconfirm --needed downgrade

# Programming languages
sudo pacman -S --noconfirm --needed lua
# sudo pacman -S --noconfirm --needed go
sudo pacman -S --noconfirm --needed python
# sudo pacman -S --noconfirm --needed zig
sudo pacman -S --noconfirm --needed npm
sudo pacman -S --noconfirm --needed deno
# sudo pacman -S --noconfirm --needed yarn
# sudo pacman -S --noconfirm --needed iverilog gtkwave
# sudo pacman -S --noconfirm --needed odin
# sudo pacman -S --noconfirm --needed jdk-openjdk
# sudo pacman -S --noconfirm --needed ghc
# sudo pacman -S --noconfirm --needed php
# sudo pacman -S --noconfirm --needed perl
# sudo pacman -S --noconfirm --needed octave
# sudo pacman -S --noconfirm --needed emscripten
# $aur_helper -S --noconfirm --needed ghdl
# $aur_helper -S --noconfirm --needed bun
# $aur_helper -S --noconfirm --needed mojo
# $aur_helper -S --noconfirm --needed flutter

# C/CPP libraries
sudo pacman -S --noconfirm --needed cmake
sudo pacman -S --noconfirm --needed glew freeglut glu glfw
# sudo pacman -S --noconfirm --needed opencv
# sudo pacman -S --noconfirm --needed raylib

# C/CPP Debuggers
sudo pacman -S --noconfirm --needed gdb ltrace strace

# Terminals tools
sudo pacman -S --noconfirm --needed ripgrep fd fzf
sudo pacman -S --noconfirm --needed man-db man-pages
sudo pacman -S --noconfirm --needed bat bat-extras
sudo pacman -S --noconfirm --needed btop ncdu
sudo pacman -S --noconfirm --needed brightnessctl
sudo pacman -S --noconfirm --needed duf
# sudo pacman -S --noconfirm --needed tmux
# sudo pacman -S --noconfirm --needed curlie
# sudo pacman -S --noconfirm --needed httpie
# sudo pacman -S --noconfirm --needed git-delta
# sudo pacman -S --noconfirm --needed whois

# Enable audio
sudo pacman -S --noconfirm --needed pipewire wireplumber
sudo pacman -S --noconfirm --needed pipewire-pulse pavucontrol pipewire-jack

# Printer
# sudo pacman -S --noconfirm --needed cups

# Bluetooth
sudo pacman -S --noconfirm --needed bluez-utils bluez

# ntfs and fat suppots
# sudo pacman -S --noconfirm --needed ntfs-3g
# sudo pacman -S --noconfirm --needed dosfstools

# usb auto mount
# sudo pacman -S --noconfirm --needed udiskie udisk2

# Multimedia
sudo pacman -S --noconfirm --needed vimiv imagemagick
sudo pacman -S --noconfirm --needed mpv mpv-mpris ffmpeg yt-dlp
# sudo pacman -S --noconfirm --needed zathura zathura-pdf-mupdf
sudo pacman -S --noconfirm --needed zathura zathura-pdf-poppler
sudo pacman -S --noconfirm --needed yazi

# Notification
sudo pacman -S --noconfirm --needed libnotify dunst

# File manager
# sudo pacman -S --noconfirm --needed nemo

# Qrcode tools
# sudo pacman -S --noconfirm --needed qrtool
# sudo pacman -S --noconfirm --needed zbar

# Scan for other os Grub
# sudo pacman -S --noconfirm --needed os-prober

# Nix, Flatpaks and Snaps supports
# $aur_helper -S --noconfirm --needed nix
# sudo pacman -S --noconfirm --needed flatpak
# $aur_helper -S --noconfirm --needed snapd
# sudo pacman -S --noconfirm --needed xdg-desktop-portal
# sudo pacman -S --noconfirm --needed xdg-desktop-portal-gtk
# sudo pacman -S --noconfirm --needed xdg-desktop-portal-hyprland
# sudo pacman -S --noconfirm --needed wlroots xdg-desktop-portal-wlr

# Cpu architecture and graphic_driver
case $cpu_architecture in # AMD Intel NONE
AMD)
	case $graphic_driver in # Nvidia Nvidia_with_Cuda NONE
	Nvidia)
		sudo pacman -S --noconfirm --needed amd-ucode nvidia
		;;
	Nvidia_with_Cuda)
		sudo pacman -S --noconfirm --needed amd-ucode nvidia cuda cudnn
		;;
	*)
		sudo pacman -S --noconfirm --needed amd-ucode
		;;
	esac
	;;
Intel)
	case $graphic_driver in # Nvidia Nvidia_with_Cuda NONE
	Nvidia)
		sudo pacman -S --noconfirm --needed intel-ucode nvidia
		;;
	Nvidia_with_Cuda)
		sudo pacman -S --noconfirm --needed intel-ucode nvidia cuda cudnn
		;;
	*)
		sudo pacman -S --noconfirm --needed intel-ucode
		;;
	esac
	;;
*) ;;
esac

# Display_manager
case $display_manager in # NONE Ly Lightdm Sddm Gdm
Ly)
	sudo pacman -S --noconfirm --needed ly
	sudo systemctl enable ly
	;;
lightdm)
	sudo pacman -S --noconfirm --needed lightdm lightdm-gtk-greeter
	sudo systemctl enable lightdm
	;;
Sddm)
	sudo pacman -S --noconfirm --needed sddm
	sudo systemctl enable sddm
	;;
Gdm)
	sudo pacman -S --noconfirm --needed gdm
	sudo systemctl enable gdm
	;;
*) ;;
esac

# Display Protocol
case $display_protocol in # Wayland Xorg NONE
Wayland)
	# sudo pacman -S --noconfirm --needed qt5-wayland qt6-wayland
	# sudo pacman -S --noconfirm --needed nwg-look
	sudo pacman -S --noconfirm --needed wl-clipboard
	sudo pacman -S --noconfirm --needed slurp wf-recorder
	sudo pacman -S --noconfirm --needed foot waybar rofi-wayland
	# Window Manager
	case $window_manager in # Niri Hyprland NONE
	Niri)
		sudo pacman -S --noconfirm --needed niri
		sudo pacman -S --noconfirm --needed swaybg swaylock
		sudo pacman -S --noconfirm --needed xwayland-satellite
		sudo pacman -S --noconfirm --needed xdg-desktop-portal-gtk xdg-desktop-portal-gnome
		;;
	Hyprland)
		sudo pacman -S --noconfirm --needed hyprland
		sudo pacman -S --noconfirm hyprpaper hyprlock
		sudo pacman -S --noconfirm --needed xdg-desktop-portal-hyprland grim hyprpicker
		# sudo pacman -S --noconfirm --needed hyprpolkitagent
		;;
	*) ;;
	esac
	;;
Xorg)
	sudo pacman -S --noconfirm --needed xorg xorg-server xorg-xinit
	sudo pacman -S --noconfirm --needed picom nitrogen rofi
	sudo pacman -S --noconfirm --needed scrot i3lock xclip
	sudo pacman -S --noconfirm --needed lxappearance
	sudo pacman -S --noconfirm --needed ghostty
	# Window Manager
	case $window_manager in # Qtile Xmonad NONE
	Qtile)
		sudo pacman -S --noconfirm --needed qtile
		sudo pacman -S --noconfirm --needed python-psutil python-iwlib
		;;
	Xmonad)
		sudo pacman -S --noconfirm --needed xmonad xmonad-contrib
		# sudo pacman -S --noconfirm --needed xmobar haskell-iwlib
		sudo pacman -S --noconfirm --needed polybar
		;;
	*) ;;
	esac
	;;
*) ;;
esac

# Virtualization
for virt_option in "${Virtualization[@]}"; do
	case $virt_option in # Qemu Docker Virt_Manager Waydroid
	Qemu)
		# sudo pacman -S --noconfirm --needed qemu-base
		sudo pacman -S --noconfirm --needed qemu-full
		;;
	Docker)
		sudo pacman -S --noconfirm --needed docker docker-buildx
		# $aur_helper -S --noconfirm --needed lazydocker-bin
		sudo usermod -aG docker "$USER"
		;;
	Virt_Manager)
		sudo pacman -S --noconfirm --needed qemu-full virt-manager dnsmasq
		sudo usermod -aG libvirt "$USER"
		;;
	*) ;;
	esac
done

# Networking Tools
for nettool in "${Network_tools[@]}"; do
	case $nettool in # Tor_Proxy Yt_Dlp Qbit_Torrent Sniffnet Wireshark Burpsuite
	Tor_Proxy)
		sudo pacman -S --noconfirm --needed tor proxychains-ng
		sudo usermod -aG tor "$USER"
		;;
	Yt_Dlp)
		sudo pacman -S --noconfirm --needed yt-dlp
		;;
	Qbit_Torrent)
		sudo pacman -S --noconfirm --needed qbittorrent
		;;
	Sniffnet)
		sudo pacman -S --noconfirm --needed sniffnet
		;;
	Wireshark)
		sudo pacman -S --noconfirm --needed wireshark-qt
		sudo usermod -aG wireshark "$USER"
		;;
	Burpsuite)
		$aur_helper -S --noconfirm --needed burpsuite
		;;
	*) ;;
	esac
done

# Browsers
for browser in "${Browsers[@]}"; do
	case $browser in # Zen_Browser Ungoogled_Chromium Firefox Tor_Browser QuteBrowser Brave_Browser Librewolf
	Zen_Browser)
		$aur_helper -S --noconfirm --needed zen-browser-bin
		# $aur_helper -S --noconfirm --needed zen-browser-avx2-bin
		;;
	Ungoogled_Chromium)
		$aur_helper -S --noconfirm --needed ungoogled-chromium-bin
		;;
	Firefox)
		sudo pacman -S --noconfirm --needed firefox
		;;
	Tor_Browser)
		sudo pacman -S --noconfirm --needed torbrowser-launcher
		;;
	QuteBrowser)
		sudo pacman -S --noconfirm --needed qutebrowser python-adblock
		;;
	Vivaldi)
		sudo pacman -S --noconfirm --needed vivaldi
		;;
	Brave_Browser)
		$aur_helper -S --noconfirm --needed brave-bin
		;;
	Librewolf)
		$aur_helper -S --noconfirm --needed librewolf-bin
		;;
	*) ;;
	esac
done

# Extra Applications
for application in "${Extra_applications[@]}"; do
	case $application in # Discord Gimp Openshot LibreOffice Texlive Spotify LocalSend
	Discord)
		sudo pacman -S --noconfirm --needed discord
		;;
	Gimp)
		sudo pacman -S --noconfirm --needed gimp
		;;
	Openshot)
		sudo pacman -S --noconfirm --needed openshot
		# sudo pacman -S --noconfirm --needed kdenlive
		# sudo pacman -S --noconfirm --needed obs-studio
		# sudo pacman -S --noconfirm --needed shotcuts
		# $aur_helper -S --noconfirm --needed davinci-resolve
		;;
	LibreOffice)
		sudo pacman -S --noconfirm --needed libreoffice
		;;
	Texlive)
		sudo pacman -S --noconfirm --needed texlive
		;;
	Spotify)
		[ -d "$HOME/local/share/gnupg" ] || mkdir ~/.local/share/gnupg
		$aur_helper -S --noconfirm --needed spotify-adblock-git
		;;
	LocalSend)
		$aur_helper -S --noconfirm --needed localsend-bin
		;;
	*) ;;
	esac
done

# Copy Configs
case $Copy_configs in # Yes No
Yes)
	[ -d "$HOME/Pictures/Screenshots" ] || mkdir -p ~/Pictures/Screenshots/
	[ -d "$HOME/Videos/Recordings" ] || mkdir -p ~/Videos/Recordings/

	[ -d "$HOME/.config" ] || mkdir ~/.config/
	cp -r ./configs/Defaults/* ~/.config/

	ln -s ~/.config/shell/profile ~/.zprofile
	ln -s ~/.config/shell/profile ~/.bash_profile
	ln -s ~/.config/shell/barshrc ~/.bashrc

	# Bat and Tmux
	bat cache --build
	[ -d "$HOME/config/tmux/tpm" ] || git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/tpm

	# Defalut File Manager and Application_Launchers
	cp -r ./configs/File_Managers/yazi ~/.config/
	cp -r ./configs/Application_Launchers/rofi ~/.config/

	case $window_manager in
	Niri)
		cp -r ./configs/Window_Managers/niri ~/.config/
		cp -r ./configs/Session_Lock/swaylock/ ~/.config/
		cp -r ./configs/Terminal_Emulators/foot ~/.config/
		cp -r ./configs/Status_Bars/waybar ~/.config/
		;;
	Hyprland)
		cp -r ./configs/Window_Managers/hypr ~/.config/
		cp -r ./configs/Terminal_Emulators/foot ~/.config/
		cp -r ./configs/Status_Bars/waybar ~/.config/
		;;
	Xmonad)
		cp -r ./configs/Window_Managers/xmonad ~/.config/
		cp -r ./configs/Terminal_Emulators/ghostty ~/.config/
		cp -r ./configs/Status_Bars/polybar ~/.config/
		;;
	Qtile)
		cp -r ./configs/Window_Managers/qtile ~/.config/
		cp -r ./configs/Terminal_Emulators/ghostty ~/.config/
		;;
	*) ;;
	esac
	;;
*) ;;
esac

# Uncomplicated Firewall (ufw) Setup
case $firewall in # Yes No
Yes)
	sudo pacman -S --noconfirm --needed ufw
	# sudo systemctl enable --now ufw
	sudo ufw enable
	;;
*) ;;
esac

# Restart after completion
case $Restart_flag in # Yes No
Yes)
	echo Restarting
	reboot
	;;
*) ;;
esac
