{
  pkgs,
  config,
  ...
}: {
  keybindings = {
    "Mod4+Return" = "exec ${config.myHome.term.command}";
    "Mod4+q" = "kill";
    "Mod4+d" = "exec ${pkgs.rofi}/bin/rofi -show drun";
    "Mod4+Escape" = "exec i3lock";

    "Mod4+h" = "focus left";
    "Mod4+j" = "focus down";
    "Mod4+k" = "focus up";
    "Mod4+l" = "focus right";

    "Mod4+Left" = "focus left";
    "Mod4+Down" = "focus down";
    "Mod4+Up" = "focus up";
    "Mod4+Right" = "focus right";

    "Mod4+f" = "fullscreen toggle";
    "Mod4+Shift+space" = "floating toggle";
    "Mod4+space" = "focus mode_toggle";

    "Mod4+w" = "layout tabbed";
    "Mod4+e" = "layout toggle split";
    "Mod4+a" = "focus parent";
    "Mod4+b" = "splith";
    "Mod4+v" = "splitv";

    "Mod4+Shift+h" = "move left";
    "Mod4+Shift+j" = "move down";
    "Mod4+Shift+k" = "move up";
    "Mod4+Shift+l" = "move right";

    "Mod4+Shift+Left" = "move left";
    "Mod4+Shift+Down" = "move down";
    "Mod4+Shift+Up" = "move up";
    "Mod4+Shift+Right" = "move right";

    "Mod4+Shift+1" = "move container to workspace number 1";
    "Mod4+Shift+2" = "move container to workspace number 2";
    "Mod4+Shift+3" = "move container to workspace number 3";
    "Mod4+Shift+4" = "move container to workspace number 4";
    "Mod4+Shift+5" = "move container to workspace number 5";
    "Mod4+Shift+6" = "move container to workspace number 6";
    "Mod4+Shift+7" = "move container to workspace number 7";
    "Mod4+Shift+8" = "move container to workspace number 8";

    "Mod4+1" = "workspace number 1";
    "Mod4+2" = "workspace number 2";
    "Mod4+3" = "workspace number 3";
    "Mod4+4" = "workspace number 4";
    "Mod4+5" = "workspace number 5";
    "Mod4+6" = "workspace number 6";
    "Mod4+7" = "workspace number 7";
    "Mod4+8" = "workspace number 8";
    "Mod4+Tab" = "workspace next_on_output";

    "Mod4+grave" = "scratchpad show";
    "Mod4+Shift+grave" = "scratchpad move";

    "Mod4+z" = "move workspace to output up";

    "Print" = "exec ${pkgs.maim}/bin/maim --window $(${pkgs.xdotool}/bin/xdotool getactivewindow) | ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png";
    "Shift+Print" = "exec ${pkgs.maim}/bin/maim --select | ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png";

    "Mod4+equal" = "resize grow width 50px";
    "Mod4+minus" = "resize shrink width 50px";

    "Mod4+Shift+c" = "reload";
    "Mod4+Shift+r" = "restart";
    "Mod4+Shift+e" = "exec i3-nagbar -t warning -m 'Exit?' -b 'Yes' 'i3-msg exit'";

    "Mod4+r" = "mode resize";
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
  };
}
