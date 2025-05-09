{userSettings, ...}: let
  mod = "Mod4"; # Super
  term = "kitty";
  menu = "rofi -show drun";
  xrandrArgs = "--output DP-4 --mode 3440x1440 --rate 144.00 --pos 0x1440 --output DP-2 --mode 2560x1440 --rate 143.97 --pos 440x0";
in {
  imports = [
    ./misc.nix

    (import ./startup.nix {
      inherit userSettings;
      inherit xrandrArgs;
    })

    (import ./keybinds.nix {
      inherit mod;
      inherit term;
      inherit menu;
    })

    ../../services/polybar/polybar.nix
    ../../services/picom/picom.nix
  ];

  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod;
      terminal = term;
      menu = menu;

      gaps = {
        inner = 10;
        outer = 0;
      };

      window.border = 3;
      window.titlebar = false;
      floating.border = 1;
      floating.titlebar = false;
      floating.modifier = mod;
      bars = [];

      assigns = {
        "5" = [{class = "^discord$";}];
        "2" = [{class = "^steam$";}];
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
