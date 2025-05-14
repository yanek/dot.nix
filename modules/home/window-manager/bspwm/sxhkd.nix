{pkgs, ...}: {
  services.sxhkd = {
    enable = true;
    keybindings = let
      term = "${pkgs.kitty}/bin/kitty";
      menu = "${pkgs.rofi}/bin/rofi";
    in {
      "super + ctrl + shift + {r,Escape}" = "shutdown -{r,h} now";
      "super + shift + Escape" = "bspc quit";
      "super + Return" = "${term}";
      "super + d" = "${menu} -show drun";
      "super + {_,shift + }q" = "bspc node -{c,k}"; # close or (w/shift) kill
      # "super + f" = "bspc desktop -l next"; # alternate desktop layout
      "super + f" = "bspc node -s \~fullscreen";
      "super + g" = "bspc node -s biggest.local"; # swap the biggest node
      "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}"; # focus node in the given direction
      "super + grave" = "bspc desktop -s next";
      "super + space" = "bspc node -t \~floating"; # floating toggle

      # focus or send to the given desktop
      "super + {_,shift + }{1-8}" = "bspc {desktop -f,node -d} '^{1-8}'";

      "super + n" = "bspc desktop -f next.local.!occupied";
      "super + {_,shift + }Tab" = "bspc desktop -f {next,prev}.local.occupied"; # focus next desktop in current monitor
      "alt + {_,shift + }Tab" = "bspc node -f {next,prev}.local.!hidden.window"; # focus next node in current monitor
    };
  };
}
