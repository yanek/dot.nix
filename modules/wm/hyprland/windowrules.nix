{...}: {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "float, class:^(Volume Control)$" # pavucontrol
      "float, title:^(Bluetooth Devices)$" # blueman

      "workspace[2], class:discord"
      "workspace[3], class:steam"

      "noinitialfocus, class:discord"

      # Browser Picture in Picture
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
      "move 69.5% 4%, title:^(Picture-in-Picture)$"
    ];
    workspace = [
      "w[1-3], monitor:DP-6"
      "w[4-6], monitor:DP-5"
    ];
  };
}
