{
  lib,
  pkgs,
  ...
}:
with lib;
{
  options.myHome.term = {
    name = mkOption {
      default = "wezterm";
      type = types.enum [
        "wezterm"
        "kitty"
      ];
    };
    package = mkPackageOption pkgs "package" { };
    command = mkOption {
      type = types.str;
    };
  };

  imports = [
    ./wezterm.nix
    ./kitty.nix
  ];
}
