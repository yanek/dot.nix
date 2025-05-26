{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.myHome.windowManager.i3;
in
{
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
      default = [ ];
      type = with types; listOf str;
    };
    extraStartupPrograms = mkOption {
      default = [ ];
      type = with types; listOf attrs;
    };
  };

  config = mkIf cfg.enable {
    xsession = {
      enable = true;
      windowManager.i3 =
        let
          mod = "Mod4";
          keybinds-submodule = import ./keybindings.nix { inherit config lib pkgs; };
          rules-submodule = import ./rules.nix;
        in
        {
          enable = true;
          package = pkgs.i3;
          config = {
            modifier = mod;
            terminal = config.myHome.term.command;
            menu = "${pkgs.rofi}/bin/rofi -show drun";
            bars = [ ];
            workspaceAutoBackAndForth = true;
            gaps = {
              inner = cfg.windowGap;
              outer = 0;
            };
            window = {
              titlebar = false;
              border = 1;
            };
            floating = {
              titlebar = false;
              border = 1;
              modifier = mod;
            };
            keybindings = keybinds-submodule.keybindings;
            modes = keybinds-submodule.modes;
            startup = import ./startup.nix { inherit config pkgs; };
            window.commands = rules-submodule.window;
            assigns = rules-submodule.assigns;
          };
        };
    };

    myHome.windowManager.extras = {
      picom.enable = true;
      polybar.enable = true;
      flashfocus.enable = true;
      dunst.enable = true;
      rofi.enable = true;
    };
  };
}
