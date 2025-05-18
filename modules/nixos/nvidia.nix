{
  config,
  lib,
  ...
}:
with lib; {
  options.mySystem.nvidia = {
    enable = mkEnableOption "nvidia";
    useBeta = mkOption {
      default = false;
      type = types.bool;
    };
  };

  config = mkIf config.mySystem.nvidia.enable {
    services.xserver.videoDrivers = ["nvidia"];

    boot = {
      initrd.kernelModules = ["nvidia"];
      kernelParams = ["nvidia-drm.fbdev=1"];
    };

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package =
        if config.mySystem.nvidia.useBeta
        then config.boot.kernelPackages.nvidiaPackages.beta
        else config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
