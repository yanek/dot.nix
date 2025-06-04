{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.myHome.windowManager.extras.polybar;
in
{
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
          background = base00;
          foreground = base06;
          height = 20;
          fixed-center = true;
          padding = 2;
          width = "100%";
          monitor = "\${env:MONITOR}";
          override-redirect = false;
          wm-restack = "i3";

          border-bottom = {
            size = 0;
          };

          separator = {
            text = "|";
            foreground = base03;
          };

          font =
            let
              inherit (config.stylix.fonts.monospace) name;
              size = builtins.toString config.stylix.fonts.sizes.desktop;
            in
            [
              "${name}:weight=Bold:size=${size};2"
              "Font Awesome 6 Brands Regular:style=Regular:size=${size};3"
              "Font Awesome 6 Free Solid:style=Solid:size=${size};3"
              "Font Awesome 6 Free Regular:style=Regular:size=${size};3"
            ];

          module.margin = {
            left = 1;
            right = 1;
          };

          modules = {
            left = "date time tray window";
            center = "workspaces";
            right = "audio-output fsroot fshelix net-wired net-wlan";
          };
        };

        "module/date" = {
          type = "internal/date";
          date = "%Y-%m-%d";
          label = "%date%";
          format = "<label>";
        };

        "module/time" = {
          type = "internal/date";
          time = "%H:%M:%S";
          label = "%time%";
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

        "module/workspaces" = {
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

        "module/spotify" = {
          type = "custom/script";
          interval = 1;
          format = " <label>";
          label = {
            foreground = base07;
          };
          exec = "exec ${lib.getExe pkgs.myScripts.polybar_spotify}";
          click = {
            left = "exec ${lib.getExe pkgs.playerctl} play-pause -p spotify";
          };
        };

        "module/audio-output" =
          let
            inherit (config.lib.stylix) colors;
            pc = "${pkgs.polybar-pulseaudio-control}/bin/pulseaudio-control";
          in
          {
            type = "custom/script";
            tail = true;
            exec = "${pc} --color-muted ${colors.base0A} --format 'VOL:\${VOL_LEVEL}%' listen";
            click = {
              left = "exec ${pkgs.pavucontrol}/bin/pavucontrol";
              middle = "exec ${pc} togmute";
            };
            scroll-up = "exec ${pc} up";
            scroll-down = "exec ${pc} down";
          };

        "module/fsroot" = {
          type = "internal/fs";
          mount = [ "/" ];
          label.mounted = "ROOTFS:%percentage_free%%";
          interval = 60;
          fixed-values = true;
          warn-percentage = 70;
          spacing = 1;
        };

        "module/fshelix" = {
          "inherit" = "module/fsroot";
          mount = [ "/mnt/helix" ];
          label.mounted = "HELIX:%percentage_free%%";
        };

        "module/net-wired" = {
          type = "internal/network";
          interface-type = "wired";
          label = {
            connected = "L:%local_ip%";
          };
        };

        "module/net-wlan" = {
          type = "internal/network";
          interface-type = "wireless";
          label = {
            connected = "W:%local_ip%@%essid%";
          };
        };
      };

      script = ''
        for m in $(polybar --list-monitors | ${pkgs.coreutils}/bin/cut -d":" -f1); do
          MONITOR=$m polybar --reload top &
        done
      '';
    };

    home.packages = [
      pkgs.font-awesome
    ];
  };
}
