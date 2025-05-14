{
  pkgs,
  config,
  ...
}: {
  services.polybar = {
    enable = true;

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
        ];

        module.margin = {
          left = 1;
          right = 1;
        };

        modules = {
          left = "date tray window";
          center = "workspaces";
          right = "audio-output net-wired net-wlan";
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
        };
      };

      "module/workspaces" = {
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

      "module/tray" = {
        type = "internal/tray";
        tray = {
          spacing = 5;
          size = "70%";
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
          middle = "${pc} togmute";
        };
        scroll-up = "${pc} up";
        scroll-down = "${pc} down";
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
          connected = "%local_ip% @ %essid";
        };
      };
    };

    script = ''
      for m in $(polybar --list-monitors | ${pkgs.coreutils}/bin/cut -d":" -f1); do
        MONITOR=$m polybar --reload top &
      done
    '';
  };
}
