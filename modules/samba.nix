{ pkgs, userSettings, ... }:

{
  environment.systemPackages = [ pkgs.cifs-utils ];
  fileSystems."/mnt/helix" = {
    device = "//192.168.1.81/share";
    fsType = "cifs";
    options =
      let
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
      [ "${automount_opts},credentials=/home/${userSettings.username}/.smb-secrets" ];
  };
}
