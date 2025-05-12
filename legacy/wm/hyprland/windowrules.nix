{...}: {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "float, title:^(Volume Control)$" # pavucontrol
      "float, title:^(Bluetooth Devices)$" # blueman

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
      "4, monitor:DP-6"
      "5, monitor:DP-5"
      "6, monitor:DP-5"
      "7, monitor:DP-5"
      "8, monitor:DP-5"
    ];
  };
}
