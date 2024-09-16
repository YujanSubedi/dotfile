# Dotfiles
Config of Qtile and Xmonad window manager with :
- Alacritty (Terminal Emulator)
- Polybar (Status Bar)
- Nitrogen (Wallpaper Manager)
- Rofi (Window Switcher/Launcher)
- Picom (Compositor)
- Lf / Rofi (File Manager)
- Neovim (Text Editor)

Qtile and Xmonad(polybar) are customized to behave analogously.
- Qtile
![Qtile](Screenshots/Qtile.png)
```bash
sudo pacman -S --nonconfirm qtile python-psutil python-iwlib
```
- Xmonad
![Xmonad](Screenshots/Xmonad.png)
```bash
sudo pacman -S --nonconfirm xmonad xmonad-contrib polybar
```
- Sddm theme: https://github.com/shinas101/Anime-sddm-theme<br>
![Sddm](Screenshots/Sddm.png)
- Grub theme: https://github.com/voidlhf/StarRailGrubThemes
![Grub](Screenshots/Grub.png)

#### Setup on Arch
On Basic installed arch install git and run following to setup the configuration.
```bash
git clone https://github.com/YujanSubedi/dotfile
cd dotfile
./install.sh
```
Grub theme can be changed from grub-customizer or by changing /etc/default/grub.

#### Setup on NixOS
On Nixos run install_on_nixos.sh bash program to run install the required nixos packages, copy the config of the applications and rebuild the nixos.
```bash
git clone https://github.com/YujanSubedi/dotfile
cd dotfile
./install_on_nixos.sh
```
The LSP on neovim, and Lf file manager image preview doesn't work as intended.

### Startx
To run the from startx xorg-xinit package is needed
```bash
sudo pacman -S xorg-xinit
```
Add following to .xinitrc
- Qtile
```bash
#!/bin/bash
exec qtile start
```
- Qtile wayland
```bash
#!/bin/bash
exec qtile start -b wayland
```
- Xmonad
```bash
#!/bin/bash
exec xmonad
```
To make .xinitrc executable
```bash
chmod +x .xinitrc
```
To run it
```bash
startx
```
To Make auto run startx in tty1 after login, Add following to .bashrc or .bash_profile
```bash
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
```

#### Hyprland

