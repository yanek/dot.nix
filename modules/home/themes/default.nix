{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options.myHome.theme = {
    variant = mkOption {
      default = "nord";
      type = types.enum [
        "ayu-dark"
        "nord"
        "grayscale"
        "nord"
        "rose-pine"
      ];
    };
  };

  config.stylix = mkIf (config.myHome.theme.variant != "") {
    enable = true;
    cursor = mkDefault {
      name = "Hackneyed";
      package = pkgs.hackneyed;
      size = 24;
    };
    iconTheme = mkDefault {
      enable = true;
      dark = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    targets = {
      cava.rainbow.enable = true;
      gtk.extraCss =
        # css
        ''
          window.background { border-radius: 0; }
        '';
    };
  };

  imports = [
    ./font.nix

    ./ayu-dark
    ./grayscale
    ./nord
    ./rose-pine
  ];
}
