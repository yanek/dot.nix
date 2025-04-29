{...}: {
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 3;
    active_opacity = 1.0;
    inactive_opacity = 0.8;
    fullscreen_opacity = 1.0;

    blur = {
      enabled = true;
      size = 12;
      passes = 2;
      new_optimizations = "on";
      ignore_opacity = true;
      xray = true;
    };

    shadow = {
      enabled = true;
      range = 10;
      render_power = 3;
    };

    layerrule = [
      "blur, waybar"
      "ignorezero, waybar"
      "blur, class:wofi"
    ];
  };
}
