{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myHome.term;
in {
  options.myHome.term = {
    package = mkPackageOption {
      default = pkgs.wezterm;
    };
    # command = mkOption {
    #   type = types.str;
    # };
  };

  config =
    (mkIf cfg.package
      == pkgs.wezterm {
        cfg.command = "${pkgs.wezterm}/bin/wezterm";
        imports = [./wezterm.nix];
      })
    (mkIf cfg.package
      == pkgs.kitty {
        cfg.command = "${pkgs.kitty}/bin/kitty";
        imports = [./kitty.nix];
      });
}
