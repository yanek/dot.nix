{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myHome.windowManager.bspwm;
in {
  options.myHome.windowManager.bspwm = {
    enable = mkOption {
      default = false;
      type = types.bool;
    };
    windowGap = mkOption {
      default = 8;
      type = types.int;
    };
    monitors = mkOption {
      default = [];
      type = with types; listOf str;
    };
    extraStartupPrograms = mkOption {
      default = [];
      type = with types; listOf str;
    };
  };

  config = mkIf cfg.enable {
    xsession = {
      enable = true;
      windowManager.bspwm = {
        enable = true;
        package = pkgs.bspwm;

        settings = {
          border_width = 2;
          window_gap = cfg.windowGap;
          split_ratio = 0.52;
          borderless_monocle = false;
          gapless_monocle = false;
          focus_follows_pointer = true;
          pointer_follows_monitor = true;
          pointer_follows_focus = false;
          pointer_modifier = "mod4";
          pointer_action1 = "move";
          pointer_action2 = "resize_size";
          pointer_action3 = "resize_corner";
        };

        startupPrograms = (import ./startup.nix {inherit config pkgs lib;}).programs;
        rules = import ./rules.nix;

        # This bit of code generates 1 * `desktopPerMonitor` workspaces
        # per configured monitor for this host/user.
        monitors = let
          desktopPerMonitor = 4;
          monitorDesktopMap =
            if cfg.monitors == []
            then {}
            else
              listToAttrs (
                imap1 (i: monitor: {
                  name = monitor;
                  value = genList (j: toString ((i - 1) * desktopPerMonitor + j + 1)) desktopPerMonitor;
                })
                cfg.monitors
              );
        in
          monitorDesktopMap;
      };
    };

    services.sxhkd = {
      enable = true;
      keybindings = import ./sxhkd.nix {inherit pkgs config;};
    };
  };

  imports = [
    ../extras/polybar.nix
    ../extras/dunst.nix
    ../extras/rofi.nix
    ../extras/picom.nix
  ];
}
