{ ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
        local wezterm = require 'wezterm'
      │ local config = wezterm.config_builder()
      │
      │ -- config.freetype_load_flags = "NO_HINTING"
      │ -- config.freetype_load_target = "HorizontalLcd"
      │ config.font_size = 11
      │ config.font = wezterm.font {family = "Fira Code", weight = "Medium"}
      │ config.max_fps = 120
      │ config.default_cursor_style = "BlinkingBar"
      │ config.cursor_thickness = 2
      │ config.cursor_blink_rate = 800
      │ config.cursor_blink_ease_in = "Constant"
      │ config.cursor_blink_ease_out = "Constant"
      │ config.window_decorations = "RESIZE"
      │ config.hide_tab_bar_if_only_one_tab = true
      │ config.window_padding = {
      │   left = 8,
      │   right = 8,
          top = 8,
          bottom =8,
        }
        return config
    '';
  };
}
