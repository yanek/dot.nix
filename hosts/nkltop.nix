{ pkgs, userSettings, ... }:

{
  imports = [
    ../modules/system/core.nix
    ../modules/system/ssh.nix
    ../modules/system/audio.nix
    ../modules/system/nas-client.nix
    ../modules/system/bluetooth.nix
    ../modules/system/wayland.nix
  ];

  boot.loader.timeout = 2;
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 5;
  };

  boot.loader.efi.canTouchEfiVariables = true;

  services.logind.lidSwitch = "poweroff";
  services.logind.lidSwitchExternalPower = "poweroff";

  networking.hostName = "nkltop";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  hardware.graphics.enable = true;

  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = "${userSettings.fullname}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      # Optional helps save long term battery health
      START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 90; # 80 and above it stops charging
    };
  };

  services.udev.packages = [ pkgs.via ];

  system.stateVersion = "24.11";
}
