{...}: {
  wayland.windowManager.hyprland.settings.windowrule = [
    "float, title:^(Volume Control)$" # pavucontrol
    "float, title:^(Bluetooth Devices)$" # blueman

    # Browser Picture in Picture
    "float, title:^(Picture-in-Picture)$"
    "pin, title:^(Picture-in-Picture)$"
    "move 69.5% 4%, title:^(Picture-in-Picture)$"
  ];
}
