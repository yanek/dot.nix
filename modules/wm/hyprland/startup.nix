{...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm app -- hyprlock"
      "[workspace 4 silent] sleep 5 && uwsm app -- kitty cava"
      "[workspace 4 silent] sleep 5 && uwsm app -- kitty btop"
      "[workspace 4 silent] uwsm app -- discord"
      "[workspace 5 silent] uwsm app -- spotify"
      "openrgb -m static -c cd3c0a"
      "[workspace 1 silent] uwsm app -- firefox"
      "[workspace 3 silent] uwsm app -- steam"
    ];
  };
}
