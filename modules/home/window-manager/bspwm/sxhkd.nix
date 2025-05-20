{
  pkgs,
  config,
  ...
}: {
  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + ctrl + shift + {r,Escape}" = "shutdown -{r,h} now";
      "super + shift + {r,Escape}" = "bspc {wm -r,quit}"; # restart or quit bspwm
      "super + Escape" = "i3lock -i ${config.stylix.image} -t";
      "super + Return" = "${config.myHome.term.command}";
      "super + d" = "${pkgs.rofi}/bin/rofi -show drun";
      "super + {_,shift + }q" = "bspc node -{c,k}"; # close or (w/shift) kill
      "super + {_,shift + }f" = "bspc {desktop -l next,node -s \~fullscreen}"; # alternate desktop layout
      "super + g" = "bspc node -s biggest.local"; # swap the biggest node
      "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}"; # focus node in the given direction
      "super + {_,shift + }{Left,Down,Up,Right}" = "bspc node -{f,s} {west,south,north,east}"; # focus node in the given direction
      "super + space" = "bspc node -t \~floating"; # floating toggle

      "super + {_,shift + }{1-8}" = "bspc {desktop -f,node -d} '^{1-8}'"; # focus or send to the given desktop

      "super + minus" = "bspc node -z left 50 0; bspc node -z right -50 0";
      "super + equal" = "bspc node -z left -50 0; bspc node -z right 50 0";
      "super + BackSpace" = "bspc node @/ --balance";

      "super + n" = "bspc desktop -f next.local.!occupied"; # focus next free desktop in current monitor
      "super + {_,shift + }Tab" = "bspc desktop -f {next,prev}.local.occupied"; # focus next occupied desktop in current monitor
      "alt + {_,shift + }Tab" = "bspc node -f {next,prev}.local.!hidden.window"; # focus next node in current monitor

      # screenshots
      "{_,super + }Print" = "${pkgs.maim}/bin/maim --{window $(${pkgs.xdotool}/bin/xdotool getactivewindow),select} | ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png";
    };
  };
}
