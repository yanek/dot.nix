{
  pkgs,
  config,
  ...
}: {
  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + ctrl + shift + {r,Escape}" = "shutdown -{r,h} now";
      "super + shift + Escape" = "bspc quit";
      "super + Return" = "${config.myHome.term.command}";
      "super + d" = "${pkgs.rofi}/bin/rofi -show drun";
      "super + {_,shift + }q" = "bspc node -{c,k}"; # close or (w/shift) kill
      "super + f" = "bspc desktop -l next"; # alternate desktop layout
      # "super + f" = "bspc node -s \~fullscreen";
      "super + g" = "bspc node -s biggest.local"; # swap the biggest node
      "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}"; # focus node in the given direction
      "super + grave" = "bspc desktop -s next";
      "super + space" = "bspc node -t \~floating"; # floating toggle

      "super + {_,shift + }{1-8}" = "bspc {desktop -f,node -d} '^{1-8}'"; # focus or send to the given desktop

      "super + n" = "bspc desktop -f next.local.!occupied";
      "super + {_,shift + }Tab" = "bspc desktop -f {next,prev}.local.occupied"; # focus next desktop in current monitor
      "alt + {_,shift + }Tab" = "bspc node -f {next,prev}.local.!hidden.window"; # focus next node in current monitor

      # screenshots
      "{_,super + }Print" = "${pkgs.maim}/bin/maim --{select,window $(${pkgs.xdotool}/bin/xdotools getactivewindow)} | ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png";
    };
  };
}
