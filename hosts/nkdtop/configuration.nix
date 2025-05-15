{
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    ../../legacy/system/core.nix
    ../../legacy/system/ssh.nix
    ../../legacy/system/nvidia.nix
    ../../legacy/system/audio.nix
    ../../legacy/system/bluetooth.nix
    ../../legacy/system/gaming.nix
    ../../legacy/system/nas-client.nix
    ../../legacy/system/xorg.nix
  ];

  boot = {
    plymouth = {
      enable = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    consoleLogLevel = 3;
    initrd = {
      verbose = false;
      kernelModules = ["nvidia"];
    };
    kernelParams = [
      "nvidia-drm.fbdev=1"
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 0;
      systemd-boot = {
        enable = true;
        configurationLimit = 30;
      };
    };
  };

  networking.hostName = "nkdtop";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = "${userSettings.fullname}";
    extraGroups = [
      "video"
      "networkmanager"
      "wheel"
    ];
  };

  services.printing.enable = true;
  hardware.keyboard.qmk.enable = true;

  services.udev.packages = [pkgs.via];
  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
  };

  # programs.hyprland = {
  #   enable = true;
  #   withUWSM = true;
  # };

  services.xserver.displayManager.setupCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --primary --mode 3440x1440 --rate 144.00 --pos 0x1440 --output DP-2 --mode 2560x1440 --rate 143.97 --pos 440x0
  '';

  environment.systemPackages = with pkgs; [
    vial
    v4l-utils
    cameractrls-gtk4
  ];

  system.stateVersion = "24.11";
}
