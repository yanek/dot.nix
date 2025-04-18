{ ... }:

let
  mod = "Mod4"; # Super
in
{
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod;

      fonts = {
        names = [ "Fira Code" ];
        style = "Regular";
        size = 11;
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
    };

    extraConfig = builtins.readFile ./config;
  };
}
