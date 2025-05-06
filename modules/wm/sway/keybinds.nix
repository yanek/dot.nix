{...}: let
  left = "h";
  down = "j";
  up = "k";
  right = "l";
  mod = "Mod4"; # Super
  term = "kitty";
  menu = "tofi-drun --drun-launch=true";
in {
  wayland.windowManager.sway.config = {
    modifier = mod;
    floating.modifier = mod;
    terminal = term;
    menu = menu;

    keybindings = {
      "${mod}+Return" = "exec ${term}";
      "${mod}+q" = "kill";
      "${mod}+d" = "exec ${menu}";
      "${mod}+Escape" = "exec swaylock";
      "${mod}+F1" = "exec gnome-calculator";

      "${mod}+${left}" = "focus left";
      "${mod}+${down}" = "focus down";
      "${mod}+${up}" = "focus up";
      "${mod}+${right}" = "focus right";

      "${mod}+Left" = "focus left";
      "${mod}+Down" = "focus down";
      "${mod}+Up" = "focus up";
      "${mod}+Right" = "focus right";

      "${mod}+f" = "fullscreen toggle";
      "${mod}+space" = "floating toggle";

      "${mod}+Shift+${left}" = "move left";
      "${mod}+Shift+${down}" = "move down";
      "${mod}+Shift+${up}" = "move up";
      "${mod}+Shift+${right}" = "move right";
      "${mod}+Shift+Left" = "move left";
      "${mod}+Shift+Down" = "move down";
      "${mod}+Shift+Up" = "move up";
      "${mod}+Shift+Right" = "move right";

      "${mod}+w" = "layout tabbed";
      "${mod}+e" = "layout toggle split";

      "${mod}+a" = "focus parent";

      "${mod}+Grave" = "move workspace to output up";
      "${mod}+Shift+Grave" = "move workspace to output down";

      "${mod}+b" = "splith";
      "${mod}+v" = "splitv";

      "${mod}+Shift+1" = "move container to workspace number 1";
      "${mod}+Shift+2" = "move container to workspace number 2";
      "${mod}+Shift+3" = "move container to workspace number 3";
      "${mod}+Shift+4" = "move container to workspace number 4";
      "${mod}+Shift+5" = "move container to workspace number 5";
      "${mod}+Shift+6" = "move container to workspace number 6";
      "${mod}+Shift+7" = "move container to workspace number 7";
      "${mod}+Shift+8" = "move container to workspace number 8";

      "${mod}+Tab" = "workspace next";

      "${mod}+1" = "workspace number 1";
      "${mod}+2" = "workspace number 2";
      "${mod}+3" = "workspace number 3";
      "${mod}+4" = "workspace number 4";
      "${mod}+5" = "workspace number 5";
      "${mod}+6" = "workspace number 6";
      "${mod}+7" = "workspace number 7";
      "${mod}+8" = "workspace number 8";

      # "Print" = "exec maim --format=png --select | ${imgToClipboard}";
      # "${mod}+Print" = "exec maim --format=png --window $(xdotool getactivewindow) | ${imgToClipboard}";
      # "Shift+Print" = "exec maim --format=png | ${imgToClipboard}";

      "${mod}+Shift+c" = "reload";
      "${mod}+Shift+e" = "exec nagbar -t warning -m 'Exit?' -b 'Yes' 'swaymsg exit'";

      "${mod}+r" = "mode resize";
    };

    modes = {
      resize = {
        ${left} = "resize shrink width 10 px or 10 ppt";
        ${down} = "resize grow height 10 px or 10 ppt";
        ${up} = "resize shrink height 10 px or 10 ppt";
        ${right} = "resize grow width 10 px or 10 ppt";

        "Left" = "resize shrink width 10 px or 10 ppt";
        "Down" = "resize grow height 10 px or 10 ppt";
        "Up" = "resize shrink height 10 px or 10 ppt";
        "Right" = "resize grow width 10 px or 10 ppt";

        "Space" = "mode default";
        "Escape" = "mode default";
        "Return" = "mode default";
      };
    };
  };
}
