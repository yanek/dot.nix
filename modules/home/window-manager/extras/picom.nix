{
  config,
  lib,
  pkgs,
  ...
}: let
  package = pkgs.picom;
in {
  home.packages = [
    package
  ];

  systemd.user.services.picom = {
    Unit = {
      Description = "Picom X11 compositor";
      After = ["graphical-session.target"];
      PartOf = ["graphical-session.target"];
    };

    Install = {
      WantedBy = ["graphical-session.target"];
    };

    Service = {
      ExecStart = lib.concatStringsSep " " [
        "${lib.getExe package}"
        "--config ${config.xdg.configFile."picom/picom.conf".source}"
      ];
      Restart = "always";
      RestartSec = 3;
    };
  };

  xdg.configFile."picom/picom.conf".text = builtins.readFile ./picom.conf;
}
