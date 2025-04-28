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
  };
}
