{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.myHome.torrentCatcher;
  from = "${config.home.homeDirectory}/downloads";
  to = "nk@192.168.1.81:/mnt/helix/torrents/_torrent";
  cmd = getExe pkgs.myScripts.file_catcher;
in
{
  options.myHome.torrentCatcher = {
    enable = mkEnableOption "torrentCatcher";
  };

  config = mkIf cfg.enable {
    systemd.user = {
      services."torrent-catcher" = {
        Unit = {
          Description = "Catches torrent files in download folder and put them in the right place";
          After = [ "graphical-session.target" ];
        };
        Service = {
          Type = "simple";
          ExecStart = "${cmd} --source ${from} --dest ${to}";
          Restart = "always";
        };
      };
    };
  };
}
