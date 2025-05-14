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

  boot.loader.timeout = 2;
  boot.loader.systemd-boot = {
    enable = true;
    # consoleMode = "max";
    configurationLimit = 30;
    # edk2-uefi-shell.enable = true;
    windows."11-gaming" = {
      title = "Windows 11";
      efiDeviceHandle = "FS3";
      sortKey = "o_windows";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = ["nvidia"];
  boot.kernelParams = [
    "nvidia-drm.fbdev=1"
  ];
  boot.loader.efi.canTouchEfiVariables = true;

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
