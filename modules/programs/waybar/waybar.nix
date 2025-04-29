{userSettings, ...}: {
  programs.waybar.enable = true;
  programs.waybar.style = builtins.readFile ../../themes/${userSettings.theme}/waybar.css;

  programs.waybar.settings.topBar = {
    layer = "top";
    position = "top";
    height = 24;
    margin-top = 10;
    margin-left = 14;
    margin-right = 14;

    modules-left = [
      "clock"
      "hyprland/window"
      "sway/mode"
    ];

    modules-center = [
      "hyprland/workspaces"
    ];

    modules-right = [
      "cpu"
      "memory"
      "pulseaudio"
      "bluetooth"
      "network"
      "battery"
      "tray"
    ];

    "cpu" = {
      interval = 10;
      format = "{}% cpu";
      max-length = 10;
    };

    "memory" = {
      interval = 30;
      format = "{}% mem";
      max-length = 10;
    };

    "clock" = {
      format = "{:%H:%M:%S}";
      interval = 1;
      tooltip-format = "<tt>{calendar}</tt>";
      calendar.format.today = "<b>{}</b>";
    };

    "battery" = {
      interval = 30;
      format = "{capacity}% {icon} ";
      format-icons = [
        ""
        ""
        ""
        ""
        ""
      ];
    };

    bluetooth = {
      format-on = "󰂯";
      format-off = "BT-off";
      format-disabled = "󰂲";
      format-connected-battery = "{device_battery_percentage}% 󰂯";
      format-alt = "{device_alias} 󰂯";
      tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
      tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
      tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
      on-click-right = "blueman-manager";
    };

    "pulseaudio" = {
      format = "{volume}% vol";
      on-click = "pavucontrol";
    };

    "network" = {
      format-wifi = "";
      format-ethernet = "";
      format-disconnected = "";
      tooltip-format-disconnected = "Error";
      tooltip-format-wifi = "{essid} ({signalStrength}%) ";
      tooltip-format-ethernet = "{ifname} 🖧 ";
      on-click = "kitty nmtui";
    };

    "hyprland/workspace" = {
      format = "{icon}";
      format-icons = {
        active = "";
        default = "";
        empty = "";
      };
      persistent-workspaces = {
        "*" = [1 2 3 4 5];
      };
    };

    "hyprland/window" = {
      format = "{title}";
      separate-outputs = true;
    };
  };
}
