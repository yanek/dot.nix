# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  pkgs,
  systemSettings,
  userSettings,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/core.nix
    ../modules/nvidia.nix
    ../modules/bspwm.nix
    ../modules/audio.nix
    ../modules/multimedia.nix
    ../modules/gaming.nix
    ../modules/3d-printing.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.sessionVariables = {
    FORCE_NIX_STABLE = "false";
  };

  # Bootloader.
  #boot.loader.grub.enable = true;
  #boot.loader.grub.device = "/dev/sda";
  #boot.loader.grub.useOSProber = true;

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 5;
    # edk2-uefi-shell.enable = true;
    windows."11-gaming" = {
      title = "Windows 11";
      efiDeviceHandle = "FS3";
      sortKey = "o_windows";
    };
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

  users.users.${userSettings.username} = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "${userSettings.fullname}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
  security.sudo.wheelNeedsPassword = false;

  services.printing.enable = true;

  programs.firefox.enable = true;

  hardware.keyboard.qmk.enable = true;

  environment.systemPackages = with pkgs; [
    discord
    wezterm
    vial
  ];

  services.udev.packages = [ pkgs.via ];
  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
  };

  fonts.packages = with pkgs; [
    ibm-plex
    fira-code
    nerd-fonts.fira-code
    nerd-fonts.blex-mono
  ];

  system.stateVersion = "24.11";
}
