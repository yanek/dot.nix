{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.myHome.spotify = {
    enable = mkEnableOption "spotify";
  };

  config.home.packages = mkIf config.myHome.spotify.enable [
    pkgs.spotify
  ];
}
