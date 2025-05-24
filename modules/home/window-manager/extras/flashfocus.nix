{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.myHome.windowManager.extras.flashfocus;
  package = pkgs.flashfocus;
  inherit (lib) getExe' concatStringsSep;
in {
  options.myHome.windowManager.extras.flashfocus = {
    enable = mkEnableOption "flashfocus";
  };

  config = mkIf cfg.enable {
    home.packages = [package];
    systemd.user.services.flashfocus = {
      Unit = {
        Description = "Perform windows animation on focus";
        After = ["graphical-session.target"];
        PartOf = ["graphical-session.target"];
      };
      Install = {
        WantedBy = ["graphical-session.target"];
      };
      Service = {
        ExecStart = concatStringsSep " " [
          "${getExe' package "flashfocus"}"
          "--simple"
          "--flash-opacity 0.5"
          "--time 100"
        ];
        Restart = "always";
        RestartSec = 3;
      };
    };
  };
}
