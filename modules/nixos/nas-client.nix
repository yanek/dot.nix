{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:
with lib; {
  options.mySystem.nas = {
    enable = mkEnableOption "nas";
    automount = mkOption {
      default = false;
      type = types.bool;
    };
  };

  config = mkIf config.mySystem.nas.enable {
    environment.systemPackages = [pkgs.cifs-utils];
    fileSystems."/mnt/helix" = {
      device = "//192.168.1.81/share";
      fsType = "cifs";
      options = let
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
        mkIf config.mySystem.nas.automount ["${automount_opts},credentials=/home/${userSettings.username}/.smb-secrets"];
    };
  };
}
