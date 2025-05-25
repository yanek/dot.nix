{
  config,
  lib,
  pkgs,
  ...
}:
let
  isTheme = config.myHome.theme.variant == "ayu-dark";
in
{
  config = lib.mkIf isTheme {
    stylix = {
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
    };

    programs.helix.settings.theme = lib.mkForce "ayu_dark";
  };
}
