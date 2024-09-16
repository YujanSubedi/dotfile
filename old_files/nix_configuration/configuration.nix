# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [ 
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    # gfxmodeEfi = "1920x1080";
    theme = "/usr/grub/themes/DanHeng";
    efiSupport = true;
    # useOSProber = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "NixOS"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    dpi = 96;
    # videoDrivers = ["nvidia" "amdgpu" ];
  };
  services.xserver.displayManager.sddm = {
    enable = true;
    settings = {
      Theme = {
	Current = "/usr/sddm/themes/Anime";
	ThemeDir = "/usr/sddm/themes";
	FacesDir = "/usr/sddm/faces";
      };
    };
  };
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };
  services.xserver.windowManager.qtile.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # Sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user_name = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    #   packages = with pkgs; [
    #     firefox
    #     tree
    #   ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow other scripts to run like lsp and plugins in neovim
  programs.nix-ld.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Termainal tools #
    vim
    git
    wget
    neovim
    neofetch
    htop
    nvtop
    cmatrix
    alacritty
    tmux
    unzip
    # Compiler, Interpreter and Livraries #
    gcc13
    ghc
    lua
    python3
    nodejs
    cmake
    # Window manager utils #
    picom
    polybar
    nitrogen
    rofi
    scrot
    brightnessctl
    # Filemanager and other application #
    lf
    yazi
    ueberzugpp
    ffmpeg
    zathura
    sxiv
    mpv
    arandr
    pavucontrol
    # Sddm theme dependency #
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    # Themes #
    arc-theme
    papirus-icon-theme
    lxappearance
    # Other applications #
    firefox
    brave
    discord
    vscode
    # Cuda #
    # cudatoolkit
    # linuxPackages.nvidia_x11
    # gitRepo
    # gnupg
    # autoconf
    # curl
    # procps
    # gnumake
    # util-linux
    # m4
    # gperf
    # unzip
    # libGLU
    # libGL
    # xorg.libXi
    # xorg.libXmu
    # freeglut
    # xorg.libXext
    # xorg.libX11
    # xorg.libXv
    # xorg.libXrandr zlib 
    # ncurses5
    # stdenv.cc
    # binutils
    # AMD utils #
    # microcodeAmd
  ];

  # Fonts
  fonts.packages = with pkgs; [
    fira-code
    noto-fonts
    jetbrains-mono
    (nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];

  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}
