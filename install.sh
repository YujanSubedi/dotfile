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
    cpu_architecture=AMD # AMD Intel NONE
    graphic_driver=Nvidia # Nvidia Nvidia_with_Cuda NONE
    display_manager=NONE # NONE Ly Lightdm Sddm Gdm
    display_protocol=Wayland # XWayland Wayland Xorg NONE
    window_manager=Hyprland # Hyprland Xmonad Qtile NONE
    aur_helper=paru # paru yay
    Copy_configs=No # Yes No
    Virtualization=(Qemu Docker) # Qemu Docker Virt_Manager
    Network_tools=(Net_tools Inetutils Bind Nmap Tor_Proxy Qbit_Torrent Yt_Dlp Wireshark Burpsuite) # Net_tools Inetutils Bind Nmap Tor_Proxy Qbit_Torrent Yt_Dlp Wireshark Burpsuite
    Browsers=(Zen_Browser Firefox Tor_Browser) # Zen_Browser Firefox Tor_Browser QuteBrowser Brave_Browser Librewolf
    Extra_applications=(Discord Gimp LibreOffice Texlive Spotify) # Discord Gimp LibreOffice Texlive Spotify
    firewall=Yes # Yes No
    Restart_flag=No # Yes No
# Let user select
else
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
    echo "Nvidia Dirvers and Cuda:"
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
    select display_protocol in XWayland Wayland Xorg NONE; do
        case $REPLY in
            0 | 1 | 2| 3)
                break
                ;;
            *)
                echo "Invalid Selection"
                ;;
        esac
    done
    echo -e "${GREEN}Display Protocol: ${YELLOW}$display_protocol${NONE}"

    echo "Window Manager:"
    select window_manager in Hyprland Xmonad Qtile NONE; do
        case $REPLY in
            1 | 2 | 3| 4)
                break
                ;;
            *)
                echo "Invalid Selection"
                ;;
        esac
    done
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

    echo "Virtualization: Multiple options can be selected selperated by space."
    options=(ALL Qemu Docker Virt_Manager)
    Virtualization=()
    for i in "${!options[@]}"; do
        echo "$i) ${options[$i]}"
    done
    read initial_choices
    read -a processed_choices<<<$(echo $initial_choices | tr " " "\n" | sort -n | uniq | tr "\n" " ")
    for choise in "${processed_choices[@]}"; do
        case $choise in
            0)
                Virtualization=(Qemu Docker Virt_Manager)
                break
                ;;
            1 | 2 | 3)
                Virtualization+=("${options[$choise]}")
                ;;
            *)
                ;;
        esac
    done
    echo -e "${BLUE}Virtualization: ${YELLOW}${Virtualization[@]}${NONE}"

    echo "Network Tools: Multiple options can be selected selperated by space."
    options=(ALL Net_tools Inetutils Bind Nmap Tor_Proxy Qbit_Torrent Yt_Dlp Wireshark Burpsuite)
    Network_tools=()
    for i in "${!options[@]}"; do
        echo "$i) ${options[$i]}"
    done
    read initial_choices
    read -a processed_choices<<<$(echo $initial_choices | tr " " "\n" | sort -n | uniq | tr "\n" " ")
    for choise in "${processed_choices[@]}"; do
        case $choise in
            0)
                Network_tools=(Net_tools Inetutils Bind Nmap Tor_Proxy Qbit_Torrent Yt_Dlp Wireshark Burpsuite)
                break
                ;;
            1 | 2 | 3 | 4 | 5 | 6 | 7 | 8)
                Network_tools+=("${options[$choise]}")
                ;;
            *)
                ;;
        esac
    done
    echo -e "${BLUE}Network Tools: ${YELLOW}${Network_tools[@]}${NONE}"

    echo "Browsers: Multiple options can be selected selperated by space."
    options=(Zen_and_Firefox Zen_Browser Firefox Tor_Browser QuteBrowser Brave_Browser Librewolf)
    Browsers=()
    for i in "${!options[@]}"; do
        echo "$i) ${options[$i]}"
    done
    read initial_choices
    read -a processed_choices<<<$(echo $initial_choices | tr " " "\n" | sort -n | uniq | tr "\n" " ")
    for choise in "${processed_choices[@]}"; do
        case $choise in
            0)
                Browsers=(Zen_Browser Firefox)
                break
                ;;
            1 | 2 | 3 | 4)
                Browsers+=("${options[$choise]}")
                ;;
            *)
                ;;
        esac
    done
    echo -e "${BLUE}Browsers: ${YELLOW}${Browsers[@]}${NONE}"

    echo "Extra Applications: Multiple options can be selected selperated by space."
    options=(ALL Discord Gimp LibreOffice Texlive Spotify)
    Extra_applications=()
    for i in "${!options[@]}"; do
        echo "$i) ${options[$i]}"
    done
    read initial_choices
    read -a processed_choices<<<$(echo $initial_choices | tr " " "\n" | sort -n | uniq | tr "\n" " ")
    for choise in "${processed_choices[@]}"; do
        case $choise in
            0)
                Extra_applications=(Discord Gimp LibreOffice Texlive Spotify)
                break
                ;;
            1 | 2 | 3 | 4)
                Extra_applications+=("${options[$choise]}")
                ;;
            *)
                ;;
        esac
    done
    echo -e "${BLUE}Extra Applications: ${YELLOW}${Extra_applications[@]}${NONE}"

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
echo -e "${RED}Copy Configs: ${YELLOW}$Copy_configs${NONE}"
echo -e "${BLUE}Virtualization: ${YELLOW}${Virtualization[@]}${NONE}"
echo -e "${BLUE}Network Tools: ${YELLOW}${Network_tools[@]}${NONE}"
echo -e "${BLUE}Browsers: ${YELLOW}${Browsers[@]}${NONE}"
echo -e "${BLUE}Extra Applications: ${YELLOW}${Extra_applications[@]}${NONE}"
echo -e "${RED}Setup Firewall: ${YELLOW}$firewall${NONE}"
echo -e "${GREEN}Restart: ${YELLOW}$Restart_flag${NONE}"

echo ""
echo "Proceed or Abort"
select Ready_to_install in Proceed Abort; do
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

# Update the Package manager and system
sudo pacman -Syu --noconfirm
sudo pacman -Fy --noconfirm

# Synchronize time by NTP
sudo timedatectl set-ntp true

# Install programming languages
sudo pacman -S --noconfirm --needed gcc
# sudo pacman -S --noconfirm --needed llvm clang
# sudo pacman -S --noconfirm --needed tcc
# sudo pacman -S --noconfirm --needed ghc
sudo pacman -S --noconfirm --needed lua
sudo pacman -S --noconfirm --needed python
sudo pacman -S --noconfirm --needed npm
# sudo pacman -S --noconfirm --needed yarn
# sudo pacman -S --noconfirm --needed emscripten
sudo pacman -S --noconfirm --needed go
# sudo pacman -S --noconfirm --needed rust
sudo pacman -S --noconfirm --needed rustup && rustup default stable
sudo pacman -S --noconfirm --needed zig
# sudo pacman -S --noconfirm --needed php
# sudo pacman -S --noconfirm --needed perl
# sudo pacman -S --noconfirm --needed octave
sudo pacman -S --noconfirm --needed iverilog gtkwave

# # C/CPP libraries
sudo pacman -S --noconfirm --needed raylib
sudo pacman -S --noconfirm --needed glew freeglut glu glfw
# sudo pacman -S --noconfirm --needed cmake

# C/CPP Debuggers
sudo pacman -S --noconfirm --needed gdb ltrace strace

# Git
sudo pacman -S --noconfirm --needed git

# To install Aur Packages
sudo pacman -S --noconfirm --needed base-devel

# Aur Helper
case $aur_helper in # paru yay
    paru)
        if ! command -v paru &>/dev/null; then
            git clone https://aur.archlinux.org/paru-git/ /tmp/paru
            makepkg -si --noconfirm --needed -D /tmp/paru
        fi
        ;;
    yay)
        if ! command -v yay &>/dev/null; then
            git clone https://aur.archlinux.org/yay-git/ /tmp/yay
            makepkg -si --noconfirm --needed -D /tmp/yay
        fi
        ;;
    *)
        ;;
esac

# Update aur_helper
$aur_helper -Syu

# Downgrade packages rollback for broken packages
$aur_helper -S --noconfirm --needed downgrade

# Additional programming languages from aur
# $aur_helper -S --noconfirm --needed ghdl
# $aur_helper -S --noconfirm --needed odin
# $aur_helper -S --noconfirm --needed bun
# $aur_helper -S --noconfirm --needed mojo

# SQL
# sudo pacman -S --noconfirm --needed postgresql
# sudo usermod -aG postgres $USER

# Vi, Vim and Neovim
# sudo pacman -S --noconfirm --needed vi vim
sudo pacman -S --noconfirm --needed neovim

# Neovim dependency
sudo pacman -S --noconfirm --needed ripgrep tar zip unzip

# Emacs
sudo pacman -S --noconfirm --needed emacs

# Fonts
sudo pacman -S --noconfirm --needed noto-fonts
# sudo pacman -S --noconfirm --needed ttf-fira-code
sudo pacman -S --noconfirm --needed ttf-jetbrains-mono
sudo pacman -S --noconfirm --needed ttf-jetbrains-mono-nerd

# Terminals tools
sudo pacman -S --noconfirm --needed man-db
sudo pacman -S --noconfirm --needed man-pages opengl-man-pages
sudo pacman -S --noconfirm --needed bash-completion zsh-completions
sudo pacman -S --noconfirm --needed usbutils fastfetch ncdu
sudo pacman -S --noconfirm --needed choose fzf parallel
sudo pacman -S --noconfirm --needed git-delta duf eza
sudo pacman -S --noconfirm --needed ripgrep-all fd
sudo pacman -S --noconfirm --needed bat bat-extras
sudo pacman -S --noconfirm --needed brightnessctl
sudo pacman -S --noconfirm --needed btop nvtop
sudo pacman -S --noconfirm --needed wget xh curlie
sudo pacman -S --noconfirm --needed openssl openssh
# sudo pacman -S --noconfirm --needed httpie
sudo pacman -S --noconfirm --needed whois
sudo pacman -S --noconfirm --needed tmux

# Notification
sudo pacman -S --noconfirm --needed dunst

# Multiwindow settings
# sudo pacman -S --noconfirm --needed arandr

# Enable audio
sudo pacman -S --noconfirm --needed pipewire wireplumber
sudo pacman -S --noconfirm --needed pipewire-pulse pavucontrol

# Printer
# sudo pacman -S --noconfirm --needed cups

# Bluetooth
# sudo pacman -S --noconfirm --needed bluez-utils bluez

# ntfs and fat suppots
# sudo pacman -S --noconfirm --needed ntfs-3g
# sudo pacman -S --noconfirm --needed dosfstools

# usb auto mount
# sudo pacman -S --noconfirm --needed udiskie udisk2

# Multimedia
sudo pacman -S --noconfirm --needed vimiv imagemagick
sudo pacman -S --noconfirm --needed mpv ffmpeg ffmpegthumbnailer
sudo pacman -S --noconfirm --needed zathura zathura-pdf-mupdf
# sudo pacman -S --noconfirm --needed zathura zathura-pdf-poppler
sudo pacman -S --noconfirm --needed yazi p7zip jq

# Qrcode tools
sudo pacman -S --noconfirm --needed qrtool
sudo pacman -S --noconfirm --needed zbar

# Scan for other os Grub
sudo pacman -S --noconfirm --needed os-prober

# Flatpaks and Snaps suppots
# sudo pacman -S --noconfirm --needed xdg-desktop-portal
# sudo pacman -S --noconfirm --needed xdg-desktop-portal-gtk
# sudo pacman -S --noconfirm --needed xdg-desktop-portal-hyprland
# sudo pacman -S --noconfirm --needed wlroots xdg-desktop-portal-wlr
# sudo pacman -S --noconfirm --needed flatpak
# $aur_helper -S --noconfirm --needed snapd

# Cpu architecture
case $cpu_architecture in # AMD Intel NONE
    AMD)
        sudo pacman -S --noconfirm --needed amd-ucode
        ;;
    Intel)
        sudo pacman -S --noconfirm --needed intel-ucode
        ;;
    *)
        ;;
esac

# Grpahic driver
case $graphic_driver in # Nvidia Nvidia_with_Cuda NONE
    Nvidia)
        sudo pacman -S --noconfirm --needed nvidia
        ;;
    Nvidia_with_Cuda)
        sudo pacman -S --noconfirm --needed nvidia cuda cudnn
        ;;
    *)
        ;;
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
    *)
        ;;
esac

# Display Protocol
case $display_protocol in # XWayland Wayland Xorg NONE
    XWayland)
        sudo pacman -S --noconfirm --needed xorg xorg-server xorg-xinit
        sudo pacman -S --noconfirm --needed wayland wayland-protocols xorg-xwayland
        sudo pacman -S --noconfirm --needed qt5-wayland qt6-wayland
        sudo pacman -S --noconfirm --needed grim slurp hyprlock
        sudo pacman -S --noconfirm --needed nwg-look wl-clipboard
        sudo pacman -S --noconfirm --needed wofi waybar swww
        sudo pacman -S --noconfirm --needed foot
        ;;
    Wayland)
        sudo pacman -S --noconfirm --needed wayland wayland-protocols xorg-xwayland
        sudo pacman -S --noconfirm --needed qt5-wayland qt6-wayland
        sudo pacman -S --noconfirm --needed grim slurp hyprlock
        sudo pacman -S --noconfirm --needed nwg-look wl-clipboard
        sudo pacman -S --noconfirm --needed wofi waybar swww
        sudo pacman -S --noconfirm --needed foot
        ;;
    Xorg)
        sudo pacman -S --noconfirm --needed xorg xorg-server xorg-xinit
        sudo pacman -S --noconfirm --needed picom nitrogen rofi
        sudo pacman -S --noconfirm --needed scrot i3lock xclip
        sudo pacman -S --noconfirm --needed lxappearance
        $aur_helper -S --noconfirm --needed ueberzugpp
        ;;
    *)
        ;;
esac

# Window Manager
case $window_manager in # Hyprland Xmonad Qtile NONE
    Hyprland)
        sudo pacman -S --noconfirm --needed hyprland
        ;;
    Xmonad)
        sudo pacman -S --noconfirm --needed xmonad xmonad-contrib
        # sudo pacman -S --noconfirm --needed xmobar haskell-iwlib
        sudo pacman -S --noconfirm --needed polybar
        ;;
    Qtile)
        sudo pacman -S --noconfirm --needed qtile
        sudo pacman -S --noconfirm --needed python-psutil python-iwlib
        ;;
    *)
        ;;
esac

# Copy Configs
case $Copy_configs in # Yes No
    Yes)
        [ -d "~/.config/" ] || mkdir ~/.config/
        cp -r ./configs/* ~/.config/

        ln -s ~/.config/shell/profile ~/.zprofile
        ln -s ~/.config/shell/profile ~/.bash_profile
        ln -s ~/.config/shell/barshrc ~/.bashrc


        # Bat and Tmux
        bat cache --build
        [ -d "~/.config/tmux/tpm" ] || git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/tpm

        case $window_manager in
            Hyprland)
                cp -r ./Display_protocol/Wayland/* ~/.config/
                cp -r ./Window_managers/Hyprland/* ~/.config/
                ;;
            Xmonad)
                sudo cp ./old_files/suckless/st /bin/
                cp -r ./Display_protocol/X11/* ~/.config/
                cp -r ./Window_managers/Xmonad/* ~/.config/
                ;;
            Qtile)
                sudo cp ./old_files/suckless/st /bin/
                cp -r ./Display_protocol/X11/* ~/.config/
                cp -r ./Window_managers/Qtile/* ~/.config/
                ;;
            *)
                ;;
        esac
        ;;
    *)
        ;;
esac

# Virtualization
for virt_option in "${Virtualization[@]}"; do
    case $virt_option in # Qemu Docker Virt_Manager
        Qemu)
            sudo pacman -S --noconfirm --needed qemu-full
            ;;
        Docker)
            sudo pacman -S --noconfirm --needed docker docker-buildx
            sudo usermod -aG docker $USER
            ;;
        Virt_Manager)
            sudo pacman -S --noconfirm --needed qemu-full virt-manager dnsmasq
            sudo usermod -aG libvirt $USER
            ;;
        *)
            ;;
    esac
done

# Networking Tools
for nettool in "${Network_tools[@]}"; do
    case $nettool in # Net_tools Inetutils Bind Nmap Tor_Proxy Yt_Dlp Qbit_Torrent Wireshark Burpsuite
        Net_tools)
            sudo pacman -S --noconfirm --needed net-tools
            ;;
        Inetutils)
            sudo pacman -S --noconfirm --needed inetutils
            ;;
        Bind)
            sudo pacman -S --noconfirm --needed bind
            ;;
        Nmap)
            sudo pacman -S --noconfirm --needed nmap gnu-netcat
            ;;
        Tor_Proxy)
            sudo pacman -S --noconfirm --needed tor proxychains-ng
            sudo usermod -aG tor $USER
            ;;
        Yt_Dlp)
            sudo pacman -S --noconfirm --needed yt-dlp
            ;;
        Qbit_Torrent)
            sudo pacman -S --noconfirm --needed qbittorrent
            ;;
        Wireshark)
            sudo pacman -S --noconfirm --needed wireshark-qt
            sudo usermod -aG wireshark $USER
            ;;
        Burpsuite)
            $aur_helper -S --noconfirm --needed burpsuite
            ;;
        *)
            ;;
    esac
done

# Browsers
for browser in "${Browsers[@]}"; do
    case $browser in # Zen_Browser Firefox Tor_Browser QuteBrowser Brave_Browser Librewolf
        Zen_Browser)
            $aur_helper -S --noconfirm --needed zen-browser-avx2-bin
            # $aur_helper -S --noconfirm --needed zen-browser-bin
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
        Brave_Browser)
            $aur_helper -S --noconfirm --needed brave-bin
            ;;
        Librewolf)
            $aur_helper -S --noconfirm --needed librewolf-bin
            ;;
        *)
            ;;
    esac
done

# Extra Applications
for application in "${Extra_applications[@]}"; do
    case $application in # Discord Gimp LibreOffice Texlive Spotify
        Discord)
            sudo pacman -S --noconfirm --needed discord
            ;;
        Gimp)
            sudo pacman -S --noconfirm --needed gimp
            ;;
        LibreOffice)
            sudo pacman -S --noconfirm --needed libreoffice
            ;;
        Texlive)
            sudo pacman -S --noconfirm --needed texlive
            ;;
        Spotify)
            [ -d ~/.local/share/gnupg ] || mkdir ~/.local/share/gnupg
            $aur_helper -S --noconfirm --needed spotify-adblock-git
            ;;
        *)
            ;;
    esac
done

# Uncomplicated Firewall (ufw) Setup
case $firewall in # Yes No
    Yes)
        sudo pacman -S --noconfirm --needed ufw
        sudo systemctl enable --now ufw
        sudo ufw enable
        ;;
    *)
        ;;
esac

# Restart after completion
case $Restart_flag in # Yes No
    Yes)
        echo Restarting
        reboot
        ;;
    *)
        ;;
esac
