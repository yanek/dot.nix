{...}: {
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 6;
    active_opacity = 1.0;
    inactive_opacity = 0.9;
    fullscreen_opacity = 1.0;

    blur = {
      enabled = true;
      size = 8;
      passes = 2;
      noise = 0.04;
      new_optimizations = "on";
      ignore_opacity = true;
      xray = false;
    };

    shadow = {
      enabled = true;
      range = 10;
      render_power = 3;
    };

    layerrule = [
      "blur, waybar"
      "ignorezero, waybar"
      # "blur, tofi" does not work?
    ];
  };

  wayland.windowManager.hyprland.settings.animations = {
    enabled = false;
  };
}
