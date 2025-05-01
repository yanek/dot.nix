{...}: {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "float, title:^(Volume Control)$" # pavucontrol
      "float, title:^(Bluetooth Devices)$" # blueman

      "workspace 4, class:discord"
      "workspace 3, class:steam"

      "noinitialfocus, class:discord"
      "noinitialfocus, class:steam"

      "immediate, class:^(.*)$"

      # Browser Picture in Picture
      "float, title:^(Picture-in-Picture)$"
      "monitor DP-6, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
      "center, title:^(Picture-in-Picture)$"
    ];
    workspace = [
      "1, monitor:DP-6"
      "2, monitor:DP-6"
      "3, monitor:DP-6"
      "4, monitor:DP-5"
      "5, monitor:DP-5"
      "6, monitor:DP-5"
    ];
  };
}
