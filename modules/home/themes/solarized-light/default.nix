{
  config,
  lib,
  pkgs,
  ...
}:
let
  isTheme = config.myHome.theme.variant == "solarized-light";
in
{
  config = lib.mkIf isTheme {
    stylix = {
      polarity = "light";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-light.yaml";
    };

    programs.helix.settings.theme = lib.mkForce "solarized_light";
  };
}
