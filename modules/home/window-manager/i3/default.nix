{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myHome.windowManager.i3;
in {
  options.myHome.windowManager.i3 = {
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
      type = with types; listOf attrs;
    };
  };

  config = mkIf cfg.enable {
    xsession.windowManager.i3 = let
      mod = "Mod4";
      keybinds-submodule =
        import ./keybindings.nix {inherit config pkgs;};
    in {
      enable = true;
      package = pkgs.i3;
      config = {
        modifier = mod;
        terminal = config.myHome.term.command;
        menu = "${pkgs.rofi}/bin/rofi -show drun";
        bars = [];
        gaps = {
          inner = cfg.windowGap;
          outer = 0;
        };
        window = {
          titlebar = false;
          border = 2;
        };
        floating = {
          titlebar = false;
          border = 2;
          modifier = mod;
        };
        # This bit of code generates 1 * `desktopPerMonitor` workspaces
        # per configured monitor for this host/user.
        # workspaceOutputAssign = let
        #   desktopPerMonitor = 4;
        #   monitorDesktopMap =
        #     if cfg.monitors == []
        #     then {}
        #     else
        #       listToAttrs (
        #         imap1 (i: monitor: {
        #           name = monitor;
        #           workspace = genList (j: toString ((i - 1) * desktopPerMonitor + j + 1)) desktopPerMonitor;
        #         })
        #         cfg.monitors
        #       );
        # in
        #   monitorDesktopMap;
        keybindings = keybinds-submodule.keybindings;
        modes = keybinds-submodule.modes;
        startup = import ./startup.nix {inherit config pkgs;};
      };
    };
  };

  imports = [
    ./rules.nix
    ../extras/polybar.nix
    ../extras/dunst.nix
    ../extras/rofi.nix
    ../extras/picom.nix
  ];
}
