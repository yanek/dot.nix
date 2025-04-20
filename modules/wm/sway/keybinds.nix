{
  mod,
  term,
  menu,
  ...
}:

let
  imgToClipboard = "xclip -selection clipboard -t image/png";
in
{
  wayland.windowManager.sway.config = {
    keybindings = {
      "${mod}+Return" = "exec ${term}";
      "${mod}+Shift+q" = "kill";
      "${mod}+d" = "exec ${menu}";

      "${mod}+h" = "focus left";
      "${mod}+j" = "focus down";
      "${mod}+k" = "focus up";
      "${mod}+l" = "focus right";

      "${mod}+Left" = "focus left";
      "${mod}+Down" = "focus down";
      "${mod}+Up" = "focus up";
      "${mod}+Right" = "focus right";

      "${mod}+f" = "fullscreen toggle";
      "${mod}+Shift+space" = "floating toggle";
      "${mod}+space" = "focus mode_toggle";

      "${mod}+Shift+h" = "move left";
      "${mod}+Shift+j" = "move down";
      "${mod}+Shift+k" = "move up";
      "${mod}+Shift+l" = "move right";

      "${mod}+Shift+Left" = "move left";
      "${mod}+Shift+Down" = "move down";
      "${mod}+Shift+Up" = "move up";
      "${mod}+Shift+Right" = "move right";

      "${mod}+Shift+1" = "move container to workspace number 1";
      "${mod}+Shift+2" = "move container to workspace number 2";
      "${mod}+Shift+3" = "move container to workspace number 3";
      "${mod}+Shift+4" = "move container to workspace number 4";
      "${mod}+Shift+5" = "move container to workspace number 5";
      "${mod}+Shift+6" = "move container to workspace number 6";
      "${mod}+Shift+7" = "move container to workspace number 7";
      "${mod}+Shift+8" = "move container to workspace number 8";

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
      "${mod}+Shift+r" = "restart";
      "${mod}+Shift+e" = "exec i3-nagbar -t warning -m 'Exit?' -b 'Yes' 'i3-msg exit'";

      "${mod}+r" = "mode resize";
      "${mod}+m" = "mode move";
    };

    modes = {
      resize = {
        "h" = "resize shrink width 10 px or 10 ppt";
        "j" = "resize grow height 10 px or 10 ppt";
        "k" = "resize shrink height 10 px or 10 ppt";
        "l" = "resize grow width 10 px or 10 ppt";

        "Left" = "resize shrink width 10 px or 10 ppt";
        "Down" = "resize grow height 10 px or 10 ppt";
        "Up" = "resize shrink height 10 px or 10 ppt";
        "Right" = "resize grow width 10 px or 10 ppt";

        "Space" = "mode default";
        "Escape" = "mode default";
        "Return" = "mode default";
      };
      move = {
        "h" = "move left";
        "j" = "move down";
        "k" = "move up";
        "l" = "move right";

        "Left" = "move left";
        "Down" = "move down";
        "Up" = "move up";
        "Right" = "move right";

        "1" = "move container to workspace number 1";
        "2" = "move container to workspace number 2";
        "3" = "move container to workspace number 3";
        "4" = "move container to workspace number 4";
        "5" = "move container to workspace number 5";
        "6" = "move container to workspace number 6";
        "7" = "move container to workspace number 7";
        "8" = "move container to workspace number 8";

        "Space" = "mode default";
        "Escape" = "mode default";
        "Return" = "mode default";
      };
    };
  };
}
