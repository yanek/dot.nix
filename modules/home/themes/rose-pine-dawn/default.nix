{
  config,
  lib,
  pkgs,
  ...
}:
let
  isTheme = config.myHome.theme.variant == "rose-pine-dawn";
in
{
  config = lib.mkIf isTheme {
    stylix = {
      polarity = "light";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-dawn.yaml";
    };

    programs.helix.settings.theme = lib.mkForce "rose_pine_dawn";
  };
}
