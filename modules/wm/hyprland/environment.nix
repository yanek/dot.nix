{
  pkgs,
  userSettings,
  ...
}: let
  wallpaper = "${userSettings.dirs.theme}/wallpaper.png";
in {
  imports = [
    ../../programs/waybar/waybar.nix
  ];

  programs.waybar.systemd.enable = true;

  programs.wofi = {
    enable = true;
  };

  programs.wlogout = {
    enable = true;
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        path = "screenshot";
        blur_passes = 3;
        blur_size = 4;
      };
      input-field = {
        size = "200,50";
        fade_on_empty = false;
      };
    };
  };

  programs.swayimg = {
    enable = true;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = true;
      preload = [wallpaper];
      wallpaper = [",${wallpaper}"];
    };
  };

  services.hyprpolkitagent = {
    enable = true;
  };

  services.mako = {
    enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "hyprlock"
      "hyprdim"
    ];
  };

  home.packages = with pkgs; [
    nemo
    nemo-fileroller
    pavucontrol
    hyprdim
    hyprshot
  ];
}
