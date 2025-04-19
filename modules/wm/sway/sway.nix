{ userSettings, ... }:

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
  ];

  services.gnome-keyring.enable = true;

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
          xkb_variant = "eu";
          accel_profile = "flat";
        };
      };

      fonts = {
        names = [ "Fira Code" ];
        style = "Regular";
      };

      gaps = {
        inner = 10;
        outer = 0;
      };

      window.border = 3;
      window.titlebar = false;
      floating.border = 1;
      floating.titlebar = false;
      floating.modifier = mod;

      bars = [
        {
          id = "top";
          position = "top";
          workspaceButtons = true;
        }
      ];

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
      ];
    };
  };
}
