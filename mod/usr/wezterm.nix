{ ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        font_size = 11
        font = wezterm.font {family = "Fira Code", weight = "Medium"}
        max_fps = 120
        default_cursor_style = "BlinkingBar"
        cursor_thickness = 2
        cursor_blink_rate = 800
        cursor_blink_ease_in = "Constant"
        cursor_blink_ease_out = "Constant"
        window_decorations = "RESIZE"
        hide_tab_bar_if_only_one_tab = true
        window_padding = {
           left = 8,
           right = 8,
           top = 8,
           bottom =8,
        }
      }
    '';
  };
}
