{...}: let
  screenshotOutput = "$HOME/pictures/screenshots";
in {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind = [
      "$mod_SHIFT, E, exec, loginctl terminate-user ''"
      "$mod_SHIFT, R, exec, hyprctl reload && notify-send -t 3000 'Hyprland reloaded!'"
      "$mod, Q, killactive"
      "$mod, ESCAPE, exec, uwsm app -- hyprlock"
      "$mod, RETURN, exec, uwsm app -- kitty"

      ", PRINT, exec, hyprshot -m region -o ${screenshotOutput}"
      "$mod, PRINT, exec, hyprshot -m window -o ${screenshotOutput}"

      "$mod, D, exec, uwsm app -- $(tofi-drun)"

      "$mod, SPACE, togglefloating"
      "$mod, F, fullscreen"

      "$mod, H,     movefocus, l"
      "$mod, J,     movefocus, d"
      "$mod, K,     movefocus, u"
      "$mod, L,     movefocus, r"
      "$mod, LEFT,  movefocus, l"
      "$mod, DOWN,  movefocus, d"
      "$mod, UP,    movefocus, u"
      "$mod, RIGHT, movefocus, r"

      "$mod_SHIFT, H,     movewindow, l"
      "$mod_SHIFT, J,     movewindow, d"
      "$mod_SHIFT, K,     movewindow, u"
      "$mod_SHIFT, L,     movewindow, r"
      "$mod_SHIFT, LEFT,  movewindow, l"
      "$mod_SHIFT, DOWN,  movewindow, d"
      "$mod_SHIFT, UP,    movewindow, u"
      "$mod_SHIFT, RIGHT, movewindow, r"

      "$mod, w, swapactiveworkspaces, current +1"

      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"

      "$mod, tab, workspace, m+1"
      "$mod, n, workspace, emptym"

      "$mod SHIFT, n, movetoworkspacesilent, emptym"
      "$mod SHIFT, 1, movetoworkspacesilent, 1"
      "$mod SHIFT, 2, movetoworkspacesilent, 2"
      "$mod SHIFT, 3, movetoworkspacesilent, 3"
      "$mod SHIFT, 4, movetoworkspacesilent, 4"
      "$mod SHIFT, 5, movetoworkspacesilent, 5"
      "$mod SHIFT, 6, movetoworkspacesilent, 6"
      "$mod SHIFT, 7, movetoworkspacesilent, 7"
      "$mod SHIFT, 8, movetoworkspacesilent, 8"
    ];

    # e -> repeat
    binde = [
      # Volume control
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ];

    # m -> mouse
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    input = {
      kb_layout = "eu";
      accel_profile = "flat";
      sensitivity = 0;
      repeat_rate = 60;
      repeat_delay = 400;
    };
  };
}
