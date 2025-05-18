{userSettings, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  boot = {
    loader = {
      timeout = 0;
      loader.systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };

      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "nkltop";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = "${userSettings.fullname}";
    extraGroups = [
      "video"
      "networkmanager"
      "wheel"
    ];
  };

  services = {
    logind = {
      lidSwitch = "poweroff";
      lidSwitchExternalPower = "poweroff";
    };
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;

        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

        START_CHARGE_THRESH_BAT0 = 40;
        STOP_CHARGE_THRESH_BAT0 = 100;
      };
    };
  };

  mySystem = {
    xorg.enable = true;
    audio.enable = true;
    bluetooth.enable = true;
    nas = {
      enable = true;
      automount = true;
    };
  };

  system.stateVersion = "24.11";
}
