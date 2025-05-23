{
  pkgs,
  lib,
  ...
}: let
  package = pkgs.flashfocus;
  inherit (lib) getExe' concatStringsSep;
in {
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
}
