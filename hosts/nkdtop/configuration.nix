{
  pkgs,
  userSettings,
  ...
}: {
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  imports = [
    ./hardware-configuration.nix
    ../../modules/system/core.nix
    ../../modules/system/ssh.nix
    ../../modules/system/nvidia.nix
    ../../modules/system/audio.nix
    ../../modules/system/bluetooth.nix
    ../../modules/system/gaming.nix
    ../../modules/system/nas-client.nix
    ../../modules/system/wayland.nix
    ../../modules/system/greetd.nix
    # ../../modules/system/sddm.nix
  ];

  boot.loader.timeout = 2;
  boot.loader.systemd-boot = {
    enable = true;
    # consoleMode = "max";
    configurationLimit = 5;
    # edk2-uefi-shell.enable = true;
    windows."11-gaming" = {
      title = "Windows 11";
      efiDeviceHandle = "FS3";
      sortKey = "o_windows";
    };
  };

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

  environment.loginShellInit = ''
    [[ "$(tty)" == /dev/tty1 ]] && sway --unsupported-gpu
  '';

  environment.systemPackages = with pkgs; [
    vial
    v4l-utils
    cameractrls-gtk4
  ];

  system.stateVersion = "24.11";
}
