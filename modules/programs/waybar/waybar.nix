{ userSettings, ... }:

{
  programs.waybar.enable = true;
  programs.waybar.style = builtins.readFile ../../themes/${userSettings.theme}/waybar.css;

  programs.waybar.settings.topBar = {
    layer = "top";
    position = "top";

    output = [
      "DP-6"
      "DP-5"
    ];

    modules-left = [
      "clock"
      "sway/window"
      "sway/mode"
    ];

    modules-center = [
      "sway/workspaces"
    ];

    modules-right = [
      "cpu"
      "memory"
      "pulseaudio"
      "bluetooth"
      "network"
      "battery"
      # "tray"
    ];

    "cpu" = {
      interval = 10;
      format = "{}% ";
      max-length = 10;
    };

    "memory" = {
      interval = 30;
      format = "{}% ";
      max-length = 10;
    };

    "clock" = {
      format = "  {:%H:%M   %e %b}";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      today-format = "<b>{}</b>";
    };

    "network" = {
      format-wifi = "  {essid}";
      format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
      format-linked = "{ifname} (No IP) ";
      format-disconnected = "";
      format-alt = "{ifname}: {ipaddr}/{cidr}";
      family = "ipv4";
      tooltip-format-wifi = "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\n {bandwidthUpBits}  {bandwidthDownBits}";
      tooltip-format-ethernet = " {ifname}\nIP: {ipaddr}\n {bandwidthUpBits}  {bandwidthDownBits}";
    };

    "sway/workspace" = {
      disable-scroll = true;
      all-outputs = true;
    };
  };
}
