{ ... }:

{
  wayland.windowManager.sway.config.output = {
    DP-6 = {
      mode = "3440x1440@144.00Hz";
      pos = "0 1440";
      transform = "normal";
      max_render_time = "off";
    };

    DP-5 = {
      mode = "2560x1440@143.973Hz";
      pos = "440 0";
      transform = "normal";
      max_render_time = "off";
    };
  };
}
