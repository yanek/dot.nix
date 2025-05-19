{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.myHome.vlc = {
    enable = mkEnableOption "vlc";
  };

  config.home.packages = mkIf config.myHome.vlc.enable [
    pkgs.vlc
  ];
}
