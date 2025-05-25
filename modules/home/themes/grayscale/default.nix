{
  config,
  lib,
  pkgs,
  ...
}:
let
  isTheme = config.myHome.theme.variant == "grayscale-dark";
in
{
  config = lib.mkIf isTheme {
    stylix = {
      polarity = "light";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/grayscale-light.yaml";
    };
  };
}
