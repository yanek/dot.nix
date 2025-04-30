{...}: {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "float, title:^(Volume Control)$" # pavucontrol
      "float, title:^(Bluetooth Devices)$" # blueman

      "workspace name:comms, class:discord"
      "workspace name:game, class:steam"

      "noinitialfocus, class:discord"
      "noinitialfocus, class:steam"

      # Browser Picture in Picture
      "float, title:^(Picture-in-Picture)$"
      "monitor DP-6, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
      "center, title:^(Picture-in-Picture)$"
    ];
    workspace = [
      "1, monitor:DP-6, defaultName:main"
      "2, monitor:DP-6, defaultName:alt"
      "3, monitor:DP-6, defaultName:game"
      "4, monitor:DP-5, defaultName:comms"
    ];
  };
}
