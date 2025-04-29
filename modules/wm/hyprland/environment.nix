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

  services.swaync = {
    enable = true;
    settings = {
      positionX = "left";
      positionY = "bottom";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-width = 350;
      control-center-margin-top = 8;
      control-center-margin-bottom = 8;
      control-center-margin-right = 0;
      control-center-margin-left = 8;
      notification-2fa-action = true;
      notification-inline-replies = true;
      notification-window-width = 350;
      notification-icon-size = 60;
      notification-body-image-height = 180;
      notification-body-image-width = 180;
      timeout = 12;
      timeout-low = 6;
      timeout-critical = 1;
      fit-to-screen = true;
      keyboard-shortcuts = true;
      image-visibility = "when available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widgets = [
        "mpris"
        "title"
        "notifications"
        "volume"
        "backlight"
        "buttons-grid"
      ];
      widget-config = {
        title = {
          "text" = "Notification Center";
          "clear-all-button" = true;
          "button-text" = "󰆴";
        };
        label = {
          "max-lines" = 1;
          "text" = "Notification Center!";
        };
        mpris = {
          "image-size" = 80;
          "image-radius" = 0;
        };
        volume = {
          "label" = "󰕾 ";
        };
        backlight = {
          "label" = "󰃟 ";
        };
        buttons-grid = {
          actions = [
            {
              label = "󰝟";
              command = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
              type = "toggle";
            }
            {
              label = "󰍭";
              command = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
              type = "toggle";
            }

            {
              label = "";
              command = "kitty nmtui";
            }
            {
              label = "";
              command = "blueman-manager";
            }
            {
              label = "󰤄";
              command = "swaync-client -d";
              type = "toggle";
            }

            {
              label = "󰀟";
              command = "gnome-network-displays";
            }

            {
              label = "󰈙";
              command = "kitty bash -i -c 'Docs'";
            }
            {
              label = "";
              command = "kitty bash -i -c 'Settings'";
            }
            {
              label = "";
              command = "kitty bash -i -c 'tasks'";
            }
            {
              label = "";
              command = "hyprlock";
            }
            {
              label = "";
              command = "reboot";
            }
            {
              label = "";
              command = "shutdown now";
            }
          ];
        };
      };
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
