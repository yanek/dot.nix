{...}: let
  screenshotOutput = "$HOME/pictures/screenshots";
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER SHIFT, E, exec, loginctl terminate-user ''"
      "SUPER SHIFT, R, exec, hyprctl reload && notify-send -t 3000 'Hyprland reloaded!'"

      "SUPER, ESCAPE, exec, uwsm app -- hyprlock"
      "SUPER, RETURN, exec, uwsm app -- kitty"

      ",      PRINT, exec, hyprshot -m region -o ${screenshotOutput}"
      "SUPER, PRINT, exec, hyprshot -m window -o ${screenshotOutput}"

      "SUPER, D, exec, uwsm app -- $(tofi-drun)"
      "SUPER, Q, killactive"

      "SUPER, SPACE, togglefloating"
      "SUPER, F,     fullscreen"

      "SUPER, H,     movefocus, l"
      "SUPER, J,     movefocus, d"
      "SUPER, K,     movefocus, u"
      "SUPER, L,     movefocus, r"
      "SUPER, LEFT,  movefocus, l"
      "SUPER, DOWN,  movefocus, d"
      "SUPER, UP,    movefocus, u"
      "SUPER, RIGHT, movefocus, r"

      "SUPER SHIFT, H,     movewindow, l"
      "SUPER SHIFT, J,     movewindow, d"
      "SUPER SHIFT, K,     movewindow, u"
      "SUPER SHIFT, L,     movewindow, r"
      "SUPER SHIFT, LEFT,  movewindow, l"
      "SUPER SHIFT, DOWN,  movewindow, d"
      "SUPER SHIFT, UP,    movewindow, u"
      "SUPER SHIFT, RIGHT, movewindow, r"

      "SUPER, w, swapactiveworkspaces, current +1"

      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"

      "SUPER, TAB, workspace, m+1"
      "SUPER, N, workspace, emptym"

      "SUPER SHIFT, N, movetoworkspacesilent, emptym"
      "SUPER SHIFT, 1, movetoworkspacesilent, 1"
      "SUPER SHIFT, 2, movetoworkspacesilent, 2"
      "SUPER SHIFT, 3, movetoworkspacesilent, 3"
      "SUPER SHIFT, 4, movetoworkspacesilent, 4"
      "SUPER SHIFT, 5, movetoworkspacesilent, 5"
      "SUPER SHIFT, 6, movetoworkspacesilent, 6"
      "SUPER SHIFT, 7, movetoworkspacesilent, 7"
      "SUPER SHIFT, 8, movetoworkspacesilent, 8"
    ];

    # e -> repeat
    binde = [
      # Volume control
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ];

    # m -> mouse
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
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
