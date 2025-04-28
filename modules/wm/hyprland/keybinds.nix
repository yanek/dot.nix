{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind = [
      "$mod_SHIFT, Q, killactive"
      "$mod, RETURN, exec, kitty"
      "$mod, D, exec, rofi -show drun"
      "$mod, W, exec, rofi -show window"
    ];

    input = {
      kb_layout = "eu";
      accel_profile = "flat";
      sensitivity = 0;
      repeat_rate = 60;
      repeat_delay = 300;
    };
  };
}
