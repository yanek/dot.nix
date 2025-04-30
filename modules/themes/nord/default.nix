{
  pkgs,
  lib,
  config,
  ...
}: let
  nord = [
    # nord0-3
    # - Polar Night
    "#2e3440"
    "#3b4252"
    "#434c5e"
    "#4c566a"

    # nord4-6
    # - Snow Storm
    "#d8dee9"
    "#e5e9f0"
    "#eceff4"

    # nord7-10
    # - Frost
    "#8fbcbb"
    "#88c0d0"
    "#81a1c1"
    "#5e81ac"

    # nord11-15
    # - Aurora
    "#bf616a" # 11 - red
    "#d08770" # 12 - orange
    "#ebcb8b" # 13 - yellow
    "#a3be8c" # 14 - green
    "#b48ead" # 15 - purple
  ];
in {
  imports = [
    ./fonts.nix
  ];

  stylix = {
    enable = true;
    base16Scheme = ./nord.yaml;
    polarity = "light";

    cursor = {
      name = "Nordic-cursors";
      package = pkgs.nordic;
      size = 24;
    };

    iconTheme = {
      enable = true;
      dark = "Papirus";
      package = pkgs.papirus-nord;
    };

    targets.gtk = {
      enable = true;
      extraCss = ''
        window.background { border-radius: 0; }
      '';
    };

    opacity = {
      terminal = 0.9;
      desktop = 0.9;
      applications = 0.9;
      popups = 0.9;
    };

    targets."waybar".enable = false;
  };

  programs.tofi.settings = {
    # selection-color = lib.mkForce (builtins.elemAt nord 14);
    selection-color = lib.mkForce (config.lib.stylix.colors.base0B);
  };
}
