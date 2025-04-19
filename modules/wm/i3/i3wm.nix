{ ... }:

let
  mod = "Mod4"; # Super
  term = "wezterm";
  menu = "rofi -show drun";
in
{
  imports = [
    ./misc.nix
    (import ./keybinds.nix ({
      mod = mod;
      term = term;
      menu = menu;
    }))

    ../../services/polybar/polybar.nix
    ../../services/picom/picom.nix
  ];

  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod;
      terminal = term;
      menu = menu;

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
      bars = [ ];

      assigns = {
        "5" = [ { class = "^discord$"; } ];
        "2" = [ { class = "^steam$"; } ];
      };
    };

    extraConfig = builtins.readFile ./config;
  };
}
