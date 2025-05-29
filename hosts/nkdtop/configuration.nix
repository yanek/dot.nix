{
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
    plymouth = {
      enable = true;
    };
    kernelPackages = pkgs.linuxPackages;
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
    xserver.displayManager.setupCommands =
      # sh
      ''
        ${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --primary --mode 3440x1440 --rate 144.00 --pos 0x1440 --output DP-2 --mode 2560x1440 --rate 143.97 --pos 440x0
      '';
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
  ];

  system.stateVersion = "24.11";
}
