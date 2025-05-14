{
  lib,
  pkgs,
  ...
}:
with lib; let
in {
  options.myHome.term = {
    package = mkPackageOption pkgs "package" {
      default = pkgs.wezterm;
    };
    command = mkOption {
      type = types.str;
    };
  };

  imports = [./wezterm.nix];
}
