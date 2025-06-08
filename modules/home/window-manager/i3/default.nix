{
  config,
  lib,
  pkgs,
  hostname,
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

  config =
    let
      mod = "Mod4";
      startup = import ./startup.nix { inherit config pkgs lib; };
      keybinds = import ./keybindings.nix { inherit config lib pkgs; };
      rules = import ./rules.nix;
      bars = import ./bars.nix {
        inherit
          config
          lib
          pkgs
          hostname
          ;
      };
    in
    mkIf cfg.enable {
      xsession = {
        enable = true;
        windowManager.i3 = {
          enable = true;
          package = pkgs.i3;
          config = {
            modifier = mod;
            terminal = config.myHome.term.command;
            menu = "${pkgs.rofi}/bin/rofi -show drun";
            bars = bars.i3bars;
            workspaceAutoBackAndForth = true;
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
            window.commands = rules.window;
            inherit startup;
            inherit (keybinds) keybindings modes;
            inherit (rules) assigns;
          };
        };
      };

      programs.i3blocks = {
        enable = true;
        bars = bars.i3blocks;
      };

      myHome.windowManager.extras = {
        picom.enable = true;
        flashfocus.enable = false;
        dunst.enable = true;
        rofi.enable = true;
      };

      home.packages = bars.extraPackages;
    };
}
