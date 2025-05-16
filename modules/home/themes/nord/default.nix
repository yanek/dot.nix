{
  config,
  lib,
  pkgs,
  ...
}: let
  isTheme = config.myHome.theme.variant == "nord";
in {
  config = lib.mkIf isTheme {
    # home.file.".config/waybar/scheme.css".source = ./scheme.css;

    stylix = {
      polarity = "dark";
      base16Scheme = ./scheme.yaml;
      image = ./wallpaper.png;

      cursor = {
        name = "Hackneyed";
        package = pkgs.hackneyed;
        size = 24;
      };

      iconTheme = {
        enable = true;
        dark = "Papirus";
        package = pkgs.papirus-nord;
      };
    };
  };
}
