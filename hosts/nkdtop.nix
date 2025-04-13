# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, systemSettings, userSettings, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/nvidia.nix
    ../modules/gnome.nix
    ../modules/audio.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  environment.sessionVariables = { FORCE_NIX_STABLE = "false"; };

  # Bootloader.
  #boot.loader.grub.enable = true;
  #boot.loader.grub.device = "/dev/sda";
  #boot.loader.grub.useOSProber = true;

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 5;
    edk2-uefi-shell.enable = true;
    # windows."11-gaming" = {
    #   title = "Windows 11";
    #   efiDeviceHandle = "FS1";
    #   sortKey = "o_windows";
    # };
  };

  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nkdtop";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  time.timeZone = systemSettings.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = systemSettings.locale;
  
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };
 
  environment.shells = with pkgs; [ zsh fish ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  programs.fish.enable = true;

  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = "${userSettings.fullname}";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  security.sudo.wheelNeedsPassword = false;
  
  services.xserver = {
    enable = true;
    xkb.layout = "eu";
  };  

  # Enable CUPS to print documents.
  services.printing.enable = true;
  
  programs.firefox.enable = true;
   
  environment.systemPackages = with pkgs; [
    wget
    git

    # misc cli tools
    zoxide
    eza
    bat
    yazi
    lazygit
    starship
    
    helix
    discord
    gnumake
    unzip
    wezterm
  ];

  system.stateVersion = "24.11";
}
