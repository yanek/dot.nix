{ userSettings, ... }:

{
  programs.waybar.enable = true;
  programs.waybar.style = builtins.readFile ../../themes/${userSettings.theme}/waybar.css;

  programs.waybar.settings.topBar = {
    layer = "top";
    position = "top";

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
      # As of today (04/20), family is broken and shows
      # ipv6 even after being set to ipv6.
      # Some settings are tweak waiting for a fix.
      # https://github.com/Alexays/Waybar/issues/3956

      # format-wifi = "  {essid}: {ipaddr}/{cidr}";
      # format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
      # format-alt = "{ifname}: {ipaddr}/{cidr}";
      format-wifi = "  {essid}";
      format-ethernet = "{ifname} ";
      format-linked = "{ifname} (No IP) ";
      format-disconnected = "";
      format-alt = "{ifname}";
      family = "ipv4";
      tooltip-format-wifi = "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nup: {bandwidthUpBits} dn: {bandwidthDownBits}";
      tooltip-format-ethernet = " {ifname}\nIP: {ipaddr}\nup: {bandwidthUpBits} dn: {bandwidthDownBits}";
    };

    "sway/workspace" = {
      disable-scroll = true;
      all-outputs = true;
    };
  };
}
