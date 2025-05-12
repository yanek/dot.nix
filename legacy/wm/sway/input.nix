{...}: {
  wayland.windowManager.sway.config.input = {
    "*" = {
      accel_profile = "flat";
    };
    "type:keyboard" = {
      xkb_layout = "eu"; # Eurkey
      repeat_rate = "60";
      repeat_delay = "400";
    };
    "type:touchpad" = {
      accel_profile = "adaptive";
      natural_scroll = "enabled";
      tap = "enabled";
      tap_button_map = "lrm";
    };
  };
}
