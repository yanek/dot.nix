{
  config,
  lib,
  pkgs,
  ...
}: let
  isTheme = config.myHome.theme.variant == "gruvbox";
in {
  config = lib.mkIf isTheme {
    # home.file.".config/waybar/scheme.css".source = ./scheme.css;

    stylix = {
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
      image = ./wallpaper.png;

      cursor = {
        name = "Hackneyed";
        package = pkgs.hackneyed;
        size = 24;
      };

      iconTheme = {
        enable = true;
        dark = "Papirus";
        package = pkgs.papirus;
      };
    };

    # xsession.windowManager.bspwm.settings = with config.lib.stylix.colors.withHashtag; let
    #   inherit (lib) mkForce;
    # in {
    #   normal_border_color = mkForce base00;
    #   active_border_color = mkForce base01;
    #   presel_feedback_color = mkForce base02;
    #   focused_border_color = mkForce base06;
    # };
  };
}
