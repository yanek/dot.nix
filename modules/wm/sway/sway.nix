{ lib, ... }:

let
  mod = "Mod4"; # Super
  term = "kitty";
  menu = "rofi -show drun";
in
{
  imports = [
    ./misc.nix
    ./startup.nix

    (import ./keybinds.nix ({
      inherit mod;
      inherit term;
      inherit menu;
    }))

    ../../programs/waybar/waybar.nix
  ];

  services.gnome-keyring.enable = true;

  programs.waybar.systemd = {
    enable = true;
    target = "sway-session.target";
  };

  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;

    swaynag = {
      enable = true;
    };

    config = {
      modifier = mod;
      terminal = term;
      menu = menu;

      input = {
        "*" = {
          xkb_layout = "eu";
          accel_profile = "flat";
        };
        "type:touchpad" = {
          accel_profile = "adaptive";
          natural_scroll = "enabled";
          tap = "enabled";
          tap_button_map = "lrm";
        };
      };

      gaps = lib.mkDefault {
        inner = 16;
        outer = 0;
      };

      window.border = 3;
      window.titlebar = false;
      floating.border = 1;
      floating.titlebar = false;
      floating.modifier = mod;

      bars = [ ];

      assigns = {
        "5" = [ { class = "^discord$"; } ];
        "2" = [ { class = "^steam$"; } ];
      };

      window.commands = [
        {
          command = "floating enable";
          criteria.class = "Lxappearance";
        }
        {
          command = "floating enable";
          criteria.window_role = "pop-up";
        }
        {
          command = "opacity 0.9";
          criteria.app_id = "kitty";
        }
      ];
    };
  };
}
