{ pkgs, userSettings, ... }:

{
  imports = [
    ../modules/system/core.nix
    ../modules/system/ssh.nix
    ../modules/system/audio.nix
    ../modules/system/nas-client.nix
    ../modules/system/wayland.nix
  ];

  boot.loader.timeout = 2;
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 5;
  };

  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nkltop";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  hardware.opengl.enable = true;

  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = "${userSettings.fullname}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  services.udev.packages = [ pkgs.via ];

  system.stateVersion = "24.11";
}
