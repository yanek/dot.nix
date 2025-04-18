{ ... }:

let
  mod = "Mod4"; # Super
in
{
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod;
      terminal = "wezterm";
      menu = "rofi";

      fonts = {
        names = [ "Fira Code" ];
        style = "Regular";
      };

      gaps = {
        inner = 10;
        outer = 6;
      };

      window.border = 1;
      window.titlebar = false;
      floating.border = 1;
      floating.titlebar = false;
      floating.modifier = mod;
      bars = [ ];

      assigns = {
        "5" = [ { class = "^discord$"; } ];
      };
    };

    extraConfig = builtins.readFile ./config;
  };
}
