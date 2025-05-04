{...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm app -- hyprlock"
      "openrgb -m static -c cd3c0a"
      "[workspace 5 silent] sleep 10 && uwsm app -- kitty cava"
      "[workspace 5 silent] sleep 10 && uwsm app -- kitty 'nix shell nixpkgs#tty-clock -c tty-clock'"
      "[workspace 5 silent] sleep 8 && uwsm app -- kitty btop"
      "[workspace 5 silent] uwsm app -- webcord"
      "[workspace 6 silent] uwsm app -- spotify"
      "[workspace 1] uwsm app -- firefox"
      "[workspace 2 silent] uwsm app -- steam"
    ];
  };
}
