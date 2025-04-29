{...}: {
  wayland.windowManager.hyprland.settings.windowrule = [
    "float, title:^(Volume Control)$" # pavucontrol
    "float, title:^(Bluetooth Devices)$" # blueman
  ];
}
