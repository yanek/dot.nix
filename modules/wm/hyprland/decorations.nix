{...}: {
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 10;
    active_opacity = 1.0;
    inactive_opacity = 0.85;
    fullscreen_opacity = 1.0;

    blur = {
      enabled = true;
      size = 6;
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
  };
}
