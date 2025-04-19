{ pkgs, userSettings, ... }:

{
  imports = [
    ../modules/host/core.nix
    ../modules/host/ssh.nix
    ../modules/host/nvidia.nix
    ../modules/host/audio.nix
    ../modules/host/gaming.nix
    ../modules/host/nas-client.nix
    ../modules/host/i3wm.nix
  ];

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

  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = "${userSettings.fullname}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  services.printing.enable = true;
  programs.firefox.enable = true;
  hardware.keyboard.qmk.enable = true;

  environment.systemPackages = with pkgs; [
    discord
    brave
    vial
    v4l-utils
    cameractrls-gtk4
  ];

  services.xserver.dpi = 96;
  services.udev.packages = [ pkgs.via ];
  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
  };

  fonts.packages = with pkgs; [
    ibm-plex
    fira-code
    open-sans
    nerd-fonts.fira-code
    nerd-fonts.blex-mono
  ];

  system.stateVersion = "24.11";
}
