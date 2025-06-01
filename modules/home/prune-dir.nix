{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.myHome.pruneDir;

  mkPruneService = name: config: {
    "prune-dir-${name}" = {
      Unit = {
        Description = "Clean up old files in ${name}";
        After = [ "graphical-session.target" ];
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${getExe pkgs.myScripts.prune_dir} --target=\"${config.path}\" --since=48 --notify";
      };
    };
  };

  mkPruneTimer = name: config: {
    "prune-dir-${name}" = {
      Unit = {
        Description = "Run prune-dir-${name}";
        Requires = [ "prune-dir-${name}.service" ];
      };
      Timer = {
        OnCalendar = "hourly";
        Persistent = true;
        RandomizedDelaySec = "10s";
      };
      Install = {
        WantedBy = [ "timers.target" ];
      };
    };
  };

  targetType = lib.types.submodule {
    options = {
      path = mkOption {
        type = types.str;
      };
    };
  };
in
{
  options.myHome.pruneDir = {
    enable = mkEnableOption "pruneDir";
    dirs = mkOption {
      default = { };
      type = with types; attrsOf targetType;
    };
  };

  config = mkIf cfg.enable {
    systemd.user = {
      services = mkMerge (mapAttrsToList mkPruneService cfg.dirs);
      timers = mkMerge (mapAttrsToList mkPruneTimer cfg.dirs);
    };
  };
}
