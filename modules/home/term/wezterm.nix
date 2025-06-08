{
  config,
  pkgs,
  lib,
  ...
}:
{
  config = lib.mkIf (config.myHome.term.name == "wezterm") {
    myHome.term = {
      package = pkgs.wezterm;
      command = "${pkgs.wezterm}/bin/wezterm";
    };

    programs.wezterm = {
      enable = true;
      enableBashIntegration = true;
      extraConfig =
        with config.lib.stylix.colors.withHashtag;
        # lua
        ''
          local wezterm = require 'wezterm'
          local config = wezterm.config_builder()

          config.font = wezterm.font(
            '${config.stylix.fonts.monospace.name}'
          )

          config.front_end = 'OpenGL'

          config.freetype_load_target = 'HorizontalLcd'
          config.freetype_render_target = 'HorizontalLcd'
          config.freetype_load_flags = 'NO_HINTING'

          config.line_height = 1.0
          config.hide_tab_bar_if_only_one_tab = true 
          config.default_cursor_style = 'BlinkingBar'
          config.warn_about_missing_glyphs = false;

          config.window_decorations = 'RESIZE'
          config.window_padding = {
            left = 8,
            right = 8,
            top = 8,
            bottom = 8,
          }

          config.colors = {
            cursor_border = '${base07}',
            cursor_fg = '${base07}',
            cursor_bg = '${base07}',
          }

          return config
        '';
    };
  };
}
