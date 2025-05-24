{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.myHome.windowManager.extras.polybar;
in {
  options.myHome.windowManager.extras.polybar = {
    enable = mkEnableOption "polybar";
  };

  config = mkIf cfg.enable {
    services.polybar = {
      enable = true;
      package = pkgs.polybar.override {
        i3Support = config.myHome.windowManager.i3.enable;
      };

      settings = with config.lib.stylix.colors.withHashtag; {
        "bar/top" = {
          locale = "fr_FR.UTF-8";
          background = base01;
          foreground = base04;
          height = 24;
          fixed-center = true;
          padding = 2;
          width = "100%";
          monitor = "\${env:MONITOR}";
          override-redirect = false;
          wm-restack =
            if config.myHome.windowManager.bspwm.enable
            then "bspwm"
            else if config.myHome.windowManager.i3.enable
            then "i3"
            else "";

          border-bottom = {
            size = 2;
            color = base00;
          };

          separator = {
            text = "|";
            foreground = base00;
          };

          font = [
            "${config.stylix.fonts.monospace.name}:weight=Bold:size=10;3"
            "Font Awesome 6 Brands Regular:style=Regular;4"
            "Font Awesome 6 Free Solid:style=Solid;4"
            "Font Awesome 6 Free Regular:style=Regular;4"
          ];

          module.margin = {
            left = 1;
            right = 1;
          };

          modules = {
            left = "date tray window";
            center = (
              if config.myHome.windowManager.bspwm.enable
              then "workspaces-bspwm"
              else if config.myHome.windowManager.i3.enable
              then "workspaces-i3"
              else ""
            );
            right = "spotify audio-output net-wired net-wlan";
          };
        };

        "module/date" = {
          type = "internal/date";
          date = "%Y-%m-%d";
          time = "%H:%M:%S";
          label = "%date% %time%";
          format = "<label>";
        };

        "module/window" = {
          type = "internal/xwindow";
          label = {
            text = "%title%";
            foreground = base07;
            maxlen = 80;
          };
        };

        "module/workspaces-bspwm" = {
          type = "internal/bspwm";
          pin-workspaces = true;
          group-by-monitor = true;
          label = {
            separator = "";
            active = {
              text = "%name%";
              foreground = base01;
              background = base04;
              padding = 1;
            };
            occupied = {
              text = "%name%";
              padding = 1;
            };
            urgent = {
              text = "%name%";
              foreground = base01;
              background = base09;
              padding = 1;
            };
            empty = {
              text = "%name%";
              foreground = base02;
              padding = 1;
            };
          };
        };

        "module/workspaces-i3" = {
          type = "internal/i3";
          pin-workspaces = true;
          group-by-monitor = true;
          label = {
            separator = "";
            focused = {
              text = "%name%";
              foreground = base01;
              background = base04;
              padding = 1;
            };
            unfocused = {
              text = "%name%";
              foreground = base02;
              padding = 1;
            };
            visible = {
              text = "%name%";
              padding = 1;
            };
            urgent = {
              text = "%name%";
              foreground = base01;
              background = base09;
              padding = 1;
            };
          };
        };

        "module/tray" = {
          type = "internal/tray";
          tray = {
            spacing = 5;
            size = "70%";
          };
        };

        "module/spotify" = let
          spotifyStatus =
            import ../../../../packages/scripts/polybar-spotify-status.nix {inherit pkgs;};
        in {
          type = "custom/script";
          interval = 1;
          format = " <label>";
          label = {
            foreground = base07;
          };
          exec = "exec ${spotifyStatus}/bin/polybar-spotify-status";
          click = {
            left = "exec ${pkgs.playerctl}/bin/playerctl play-pause -p spotify";
          };
        };

        "module/audio-output" = let
          pc = "${pkgs.polybar-pulseaudio-control}/bin/pulseaudio-control";
          colors = config.lib.stylix.colors;
        in {
          type = "custom/script";
          tail = true;
          exec = "${pc} --color-muted ${colors.base0A} --format '\${VOL_LEVEL}% vol' listen";
          click = {
            left = "exec ${pkgs.pavucontrol}/bin/pavucontrol";
            middle = "exec ${pc} togmute";
          };
          scroll-up = "exec ${pc} up";
          scroll-down = "exec ${pc} down";
        };

        "module/net-wired" = {
          type = "internal/network";
          interface-type = "wired";
          label = {
            connected = "%local_ip%";
          };
        };

        "module/net-wlan" = {
          type = "internal/network";
          interface-type = "wireless";
          label = {
            connected = "%local_ip% @ %essid%";
          };
        };
      };

      script =
        # sh
        ''
          for m in $(polybar --list-monitors | ${pkgs.uutils-coreutils-noprefix}/bin/cut -d":" -f1); do
            MONITOR=$m polybar --reload top &
          done
        '';
    };

    home.packages = [
      pkgs.font-awesome
    ];
  };
}
