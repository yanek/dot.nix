{
  config,
  lib,
  pkgs,
  ...
}: let
  isTheme = config.myHome.theme.variant == "rose-pine";
in {
  config = lib.mkIf isTheme {
    stylix = {
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
      image = ./wallpaper.png;
    };

    programs.helix.settings.theme = lib.mkForce "rose_pine";
  };
}
