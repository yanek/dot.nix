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
    style = ''
      window {
        opacity: 0.8;
      }
    '';
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        # path = "screenshot";
        path = "${userSettings.dirs.theme}/wallpaper.png";
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
    borderRadius = 3;
    defaultTimeout = 8000;
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 900;
          on-timeout = "hyprlock";
        }
        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "hyprlock"
      # "${pkgs.hyprdim}/bin/hyprdim"
    ];
  };

  home.packages = with pkgs; [
    nemo
    nemo-fileroller
    pavucontrol
    hyprshot
  ];
}
