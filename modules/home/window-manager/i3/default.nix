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
          border = 0;
        };
        floating = {
          titlebar = false;
          border = 0;
          modifier = mod;
        };
        # colors = let
        #   transp = "#00000000";
        # in {
        #   urgent.childBorder = mkForce transp;
        #   focusedInactive.childBorder = mkForce transp;
        #   unfocused.childBorder = mkForce transp;
        #   placeholder.childBorder = mkForce transp;
        # };
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
