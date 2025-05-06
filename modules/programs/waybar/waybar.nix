{userSettings, ...}: {
  programs.waybar.enable = true;
  programs.waybar.style = builtins.readFile ../../themes/${userSettings.theme}/waybar.css;

  programs.waybar.settings.topBar = {
    layer = "top";
    position = "top";
    height = 24;

    modules-left = [
      "clock"
      "hyprland/window"
      "sway/window"
      "sway/mode"
    ];

    modules-center = [
      "hyprland/workspaces"
      "sway/workspaces"
    ];

    modules-right = [
      "cpu"
      "memory"
      "pulseaudio"
      "bluetooth"
      "network"
      "battery"
    ];

    cpu = {
      format = "cpu";
      tootltip = true;
    };

    memory = {
      format = "mem";
    };

    clock = {
      format = "{:%H:%M:%S}";
      interval = 1;
      tooltip-format = "<tt>{calendar}</tt>";
      calendar.format.today = "<b>{}</b>";
    };

    battery = {
      interval = 30;
      format = "{capacity}% {icon}";
      format-charging = "{capacity}% 󰂄";
      format-plugged = "{capacity}% 󰂄 ";
      states = {
        good = 95;
        warning = 30;
        critical = 15;
      };
      format-icons = [
        "󰁻"
        "󰁼"
        "󰁾"
        "󰂀"
        "󰂂"
        "󰁹"
      ];
    };

    bluetooth = {
      format-on = "bt";
      format-off = "bt-off";
      format-disabled = "bt-off";
      tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
      tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
      tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
      on-click = "swaymsg exec blueman-manager";
    };

    pulseaudio = {
      format = "vol:{volume}";
      format-muted = "muted";
      on-click = "swaymsg exec pavucontrol";
    };

    network = {
      format-wifi = "wifi: {essid}";
      format-ethernet = "eth";
      format-disconnected = "";
      tooltip-format-disconnected = "Error";
      tooltip-format-wifi = "{essid} ({signalStrength}%) ";
      tooltip-format-ethernet = "{ifname}";
      on-click = "swaymsg exec 'kitty nmtui'";
    };

    "systemd-failed-units" = {
      "hide-on-ok" = true;
      "format" = "err:{nr_failed}";
      "system" = true;
      "user" = true;
    };

    "hyprland/workspaces" = {
      format = "{icon}";
      all-outputs = false;
      persistent-workspaces = {
        "DP-6" = [1 2 3 4];
        "DP-5" = [5 6 7 8];
      };
    };

    "hyprland/window" = {
      format = "{title}";
      separate-outputs = true;
    };

    "sway/workspaces" = {
      format = "{value}";
      all-outputs = false;
      persistent-workspaces = {
        "1" = ["DP-6"];
        "2" = ["DP-6"];
        "3" = ["DP-6"];
        "4" = ["DP-6"];
        "5" = ["DP-5"];
        "6" = ["DP-5"];
        "7" = ["DP-5"];
        "8" = ["DP-5"];
      };
    };

    "sway/window" = {
      format = "{title}";
      all-outputs = false;
    };

    "sway/mode" = {
      format = "{}";
    };
  };
}
