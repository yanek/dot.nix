{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.myHome.print-3d = {
    enable = mkEnableOption "print-3d";
  };

  config.home.packages = with pkgs;
    mkIf config.myHome.print-3d.enable [
      prusa-slicer
    ];
}
