{
  config,
  pkgs,
  userSettings,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    consoleLogLevel = 3;
    initrd = {
      verbose = false;
    };
    kernelParams = [
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
        configurationLimit = 10;
      };
    };
    supportedFilesystems = [ "ntfs" ];
  };

  networking = {
    hostName = "nkdtop";
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
    printing.enable = true;
    udev.packages = [ pkgs.via ];
    hardware.openrgb = {
      enable = true;
      motherboard = "amd";
    };
    xserver = {
      dpi = 110;
      displayManager.setupCommands =
        # sh
        ''
          ${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --primary --mode 3440x1440 --rate 144.00 --pos 0x1440 --output DP-2 --mode 2560x1440 --rate 143.97 --pos 440x0
        '';
    };
  };

  fileSystems =
    let
      inherit (config.users.users.${userSettings.username}) uid;
      options = [
        "users"
        "nofail"
        "x-gvfs-show"
        "rw"
        "uid=${toString uid}"
      ];
      fsType = "ntfs-3g";
    in
    {
      "/mnt/windows" = {
        device = "/dev/disk/by-uuid/46FA641CFA640B0F";
        inherit options fsType;
      };
      "/mnt/ceres" = {
        device = "/dev/disk/by-uuid/EEBACF36BACEF9DB";
        inherit options fsType;
      };
    };

  hardware.keyboard.qmk.enable = true;

  mySystem = {
    xorg = {
      enable = true;
      windowManager = "i3";
    };
    audio.enable = true;
    bluetooth.enable = true;
    gaming.enable = true;
    nvidia = {
      enable = true;
      useBeta = false;
    };
    nas = {
      enable = true;
      automount = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vial
    v4l-utils
    cameractrls-gtk4
    libsForQt5.xp-pen-deco-01-v2-driver
  ];

  system.stateVersion = "24.11";
}
