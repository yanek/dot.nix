{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf (config.myHome.term.name == "wezterm") {
    myHome.term = {
      package = pkgs.wezterm;
      command = "${pkgs.wezterm}/bin/wezterm";
    };

    programs.wezterm = {
      enable = true;
      enableBashIntegration = true;
      extraConfig = ''
        local wezterm = require 'wezterm'
        local config = wezterm.config_builder()

        config.freetype_load_target = "Light"
        config.freetype_render_target = "HorizontalLcd"
        config.window_decorations = "RESIZE"
        config.hide_tab_bar_if_only_one_tab = true

        config.window_padding = {
          left = 10,
          right = 10,
          top = 10,
          bottom = 10,
        }

        return config
      '';
    };
  };
}
