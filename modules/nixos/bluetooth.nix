{
  config,
  lib,
  ...
}:
with lib; {
  options.mySystem.bluetooth = {
    enable = mkEnableOption "bluetooth";
  };

  config = mkIf config.mySystem.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    services.blueman.enable = true;
  };
}
