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
    ];

    cpu = {
      format = "";
      tootltip = true;
    };

    memory = {
      format = "";
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
      format-on = "󰂯";
      format-off = "BT-off";
      format-disabled = "󰂲";
      tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
      tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
      tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
      on-click = "blueman-manager";
    };

    pulseaudio = {
      format = "{volume}% ";
      format-muted = "";

      on-click = "pavucontrol";
    };

    network = {
      format-wifi = "";
      format-ethernet = "eth";
      format-disconnected = "";
      tooltip-format-disconnected = "Error";
      tooltip-format-wifi = "{essid} ({signalStrength}%) ";
      tooltip-format-ethernet = "{ifname}";
      on-click = "kitty nmtui";
    };

    "hyprland/workspaces" = {
      format = "{name}";
      all-outputs = false;
      format-icons = {
        active = "";
        default = "";
        empty = "";
      };
      persistent-workspaces = {
        "DP-6" = [1 2 3];
        "DP-4" = [4 5 6];
      };
    };

    "hyprland/window" = {
      format = "{title}";
      separate-outputs = true;
    };
  };
}
