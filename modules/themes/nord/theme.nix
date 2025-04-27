{ pkgs, ... }:

let
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
in
{
  imports = [
    ./fonts.nix
  ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    polarity = "dark";

    cursor = {
      name = "Nordic-cursors";
      package = pkgs.nordic;
      size = 24;
    };

    iconTheme = {
      enable = true;
      dark = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    targets.gtk = {
      enable = true;
      extraCss = ''
        window.background { border-radius: 0; }
      '';
    };

    targets."waybar".enable = false;
    # targets."gtk".enable = false;
    targets."helix".enable = false;
    targets."sway".enable = false;

  };

  # gtk = {
  #   enable = true;

  #   theme = {
  #     name = "Nordic";
  #     package = pkgs.nordic;
  #   };

  #   # iconTheme = {
  #   #   name = "Nordic-blueish";
  #   #   package = pkgs.nordic;
  #   # };

  #   gtk3.extraConfig = {
  #     gtk-application-prefer-dark-theme = true;
  #     gtk-key-theme-name = "Nordic";
  #     gtk-icon-theme-name = "Nordic-blueish";
  #   };
  # };

  # dconf.settings = {
  #   "org/gnome/desktop/interface" = {
  #     gtk-theme = "Nordic";
  #     color-scheme = "prefer-dark";
  #   };
  # };

  # xdg.systemDirs.data = [
  #   "${pkgs.gtk3}/share/gsettings-schema/${pkgs.gtk3.name}"
  #   "${pkgs.gsettings-desktop-schemas}/share/gsettings-shemas/${pkgs.gsettings-desktop-schemas.name}"
  # ];

  programs.helix = {
    settings = {
      theme = "nord";
    };
  };

  wayland.windowManager.sway.config.colors = {
    background = builtins.elemAt nord 0;

    focused = {
      border = builtins.elemAt nord 5;
      background = builtins.elemAt nord 0;
      text = builtins.elemAt nord 5;
      indicator = builtins.elemAt nord 6;
      childBorder = builtins.elemAt nord 4;
    };

    focusedInactive = {
      border = builtins.elemAt nord 2;
      background = builtins.elemAt nord 0;
      text = builtins.elemAt nord 5;
      indicator = builtins.elemAt nord 3;
      childBorder = builtins.elemAt nord 2;
    };

    unfocused = {
      border = builtins.elemAt nord 2;
      background = builtins.elemAt nord 0;
      text = builtins.elemAt nord 5;
      indicator = builtins.elemAt nord 3;
      childBorder = builtins.elemAt nord 2;
    };

    placeholder = {
      border = builtins.elemAt nord 2;
      background = builtins.elemAt nord 0;
      text = builtins.elemAt nord 5;
      indicator = builtins.elemAt nord 3;
      childBorder = builtins.elemAt nord 2;
    };

    urgent = {
      border = builtins.elemAt nord 11;
      background = builtins.elemAt nord 0;
      text = builtins.elemAt nord 5;
      indicator = builtins.elemAt nord 11;
      childBorder = builtins.elemAt nord 4;
    };
  };

}
