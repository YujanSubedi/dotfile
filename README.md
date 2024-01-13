# Dotfiles
sddm theme: https://github.com/shinas101/Anime-sddm-theme<br>
grub theme: https://github.com/voidlhf/StarRailGrubThemes

### install configuration of arch
```bash
git clone https://github.com/YujanSubedi/dotfile
cd dotfile
./install.sh
```

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

### for neovim config
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
then go to .config/nvim/lua/nvimprof and open nvim and run :so to source and then :PackerSync to install package


### to change wallpaper
```bash
nitrogen
```
add wallpapers directory and select the wallpaper


### to change lockscreen background
go to .config/qtile/lock and replace lock.png inmage


### to change login screen background
go to /usr/share/sddm/themes/Anime and replace background.jpg, need sudo permission


### to change grub theme
use grub-customier and change theme or go to /boot/grub/grub.cfg and change the theme


### to change theme
run lxappearance and navigate


### to change fontsize 
go to .config/alacritty and change the fontsize in the alacritty.yml config file


### to change user avatar
replace ($USER).face.icon on /usr/share/sddm/faces


### network and volume control
for network run nm-applet

for volume run pavucontrol


### for paru or yay-git
paru
```bash
git clone https://aur.archlinux.org/paru.git
```
yay
```bash
git clone https://aur.archlinux.org/yay-git.git
```
then cd to paru or yay-git file and install it by makepkg -si command ,requires base-devel


### to remove dual boot
run cmd as admin,
```cmd
diskpart
```
then navigate to boot efi file by select and list command on disk, partition, part, volume 

efi lies on system with around 100 to 500 MB partaion, denoted by efi or fat file

once u go to volume with boot, run assign letter =(some letter)

exit and go the drive u created by cmd and remove the diretory by 
```cmd
rd (os bootloader) /s
```
remove files by the disk partition app and delete part and extend it main disk or add new drive


# install arch

### Network Connection
take the flashed usb and boot the device with the usb by the changing priority by uefi setting

connect to ethernet ,or by wifi with
```bash
iwctl
```

list device by 
    
    device list

if the powered if off, on it by,

    adapter phy0 set-property Powered on

then run
    
    station wlan0 scan
    station wlan0 get-networks
    station wlan0 connect SSID

give the pasword

exit iwctl

change phy0 and wlan0 if other adapter and device are in used

check the connection by ping command ,you can ping archlinux.org


### Disk partition
list disk by 
```bash
fdisk -l
``` 
add partaion if not avaible by 
```bash
cfdisk /dev/--drive--
```
Partition needed

1. file partition   -> store the files                                             (More than 15 GB, as much as u like the os to have)
    
2. boot partition   -> store efi boot info to boot into the os                     (Around 100 MB to 500 MB)
    
3. swap partition   -> acts as ram if the RAM is completely filled or fails        (Around 2 GB to 4 GB, you dont need swap if you have large RAM)

You can have two file partitions to store the base file and packages on one and save personal file on other

You dont need extra boot partation if you want dual boot you can just mount the boot partaion of other os to boot of the new os

You can also use same swap partation for two different linux os

change file type by:

for file system change to ext4
```bash
mkfs.ext4 /dev/file_partition
```

for boot loader change to fat 32
```bash
mkfs.fat -F32 /dev/boot_partition
```

for swap partition change to swap 
```bash
mkswap /dev/swap_partition
```

you dont need to make the partaion if you already have required partation

### mount the partition

mount the file partition to /mnt

- if you have two file partition mount the partition you want to save personal file to /mnt/home

mount boot partation with /mnt/boot/efi

swap on the swap partation

you need to make files as they does not exit, or you can mount after you install base files

i.e.

for boot
```bash
mkdir -p /mnt/boot/efi
```

for file partation if you want to store personal files in differnt partition
``` bash
mkdir -p /mnt/home
```

mount file system by,
```bash
mount /dev/file_partion /mnt
```

mount boot partition by,
```bash
mount /dev/boot_partion /mnt/boot/efi
```

enable swap by,
```bash
swapon /dev/swap_partation
```

mount personal partation by,
```bash
mount /dev/file_partion2 /mnt/home
```

### install base file
run pacstrp on /mnt to install

1.  base                ->      gnu/linux file system
    
2.  linux               ->      linux kernal
    
3.  linux-firmware      ->      firmware for gnu/linux
    
4.  grub                ->      boot loader
    
5.  efibootmgr          ->      boot manager
    
6.  os-prober           ->      to serach for other os in dual boot
    
7.  vim                 ->      text editor to change config
    
8.  sudo                ->      superuser do better way to handle the root permission
    
9.  networkmanager      ->      package to manage the network
    
10. sof-firmware        ->      other basic firmware
    
11. amd-ucode           ->      software for amd processor
    
12. intel-ucode         ->      software for intel processor

```bash
pacstrap /mnt base linux linux-firmware sof-firmware sudo vim grub efibootloader os-prober networkmanager
```
make sure to mount main file filesystem to /mnt before install

add amd-ucode or intel-ucode depending on processor

### fstab
the os needs to know which partition are in use so we need to have the fstab on etc directory

first mount and enable swap then generate fstab and store it on /mnt/etc/fstab

generate fstab by,
```bash
genfstab /mnt
```

check the contains if it is accurate then, add the contains to fstab by,
```bash
genfstab /mnt >> /mnt/etc/fstab
```

">>" command will append the output of command previous used to file specified

you can check contains of fstab by,
```bash
cat /mnt/etc/fstab
```

### chroot
now we need to goto the arch and make the change basic config 
```bash
arch-chroot /mnt
```

##### Locale gen:   
vim into the locale.gen on etc and uncomment "en_US.UTF-8", you can serach by "/" key
```bash
vim /etc/locale.gen
```
once uncommented generate it by
```bash
locale-gen
```
now add encoding language by,
```bash
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
```

##### Timezone:
give name to your pc by,
```bash
sudo ln -sf /usr/share/zoneinfo/... /etc/localtime
hwclock --systohc
```
change ... with your timezone

##### Hostname:
give name to your pc by,
```bash
echo "PC_name" >> /etc/hostname
```

give password to root by,
```bash
passwd
```

##### Add user:
    
add user on wheel group
```bash
useradd -m -G wheel -s /bin/bash user_name
```
give password to user
```bash
passwd user_name
```
give wheel sudo permission to run superuser commands, by going visudo and uncomment %wheel ALL=(ALL:ALL) in the permission with password,
```bash
visudo
```
it is on near end you can navigate to end by (shift+g) key


##### Enable network manager:
```bash
systemctl enable NetworkManager
```

##### Install Grub:
```bash
grub-install
```
add dual boot by going to /etc/default/grub and uncomment the last line
```bash
vim /etc/default/grub
```
now update grub to find os
```bash
grub-mkconfig -o /boot/grub/grub.cfg
```
if dual boot is not found you can debug later by grub-customizer dont worry

Exit chroot

### unmount all by,
```bash
umount -a
```

reboot by,
```bash
reboot
```
## Now all Arch is installed and u can remove the usb

### connect to network by wifi
```bash
nmcli d wifi list
```
to show list of wifi

``` bash
nmcli d wifi connect (SSID) password (PASSWORD)
```
change (SSID) with the id and (PASSWORD) with the password of that ssid

### to sync time
if time is not synced
```bash
sudo ln -sf /usr/share/zoneinfo/Asia/... /etc/localtime
sudo timedatectl set-ntp true
```
change ... with your timezone

### installl xorg, wayland, xinit, windowmanager, display manager, desktop environment of choise
```bash
sudo pacman -S xorg xorg-server
```

### install git
```bash
sudo pacman -S git
```
