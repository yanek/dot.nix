{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.myHome.gimp = {
    enable = mkEnableOption "gimp";
  };

  config.home.packages = mkIf config.myHome.gimp.enable [
    pkgs.gimp
  ];
}
