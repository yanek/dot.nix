{ ... }:
let
  toggle =
    program:
    let
      prog = builtins.substring 0 14 program;
    in
    "pkill ${prog} || uwsm app -- ${program}";
in
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind =
      [
        "$mod_SHIFT, E, exec, killall hyprland"
        "$mod, Escape, exec, ${toggle "wlogout"} -p layer-shell"
        "$mod, RETURN, exec, kitty"

        "$mod, D, exec, wofi --show drun"
        "$mod, W, exec, wofi --show window"

        "$mod, SPACE, togglefloating"
        "$mod, F, fullscreen"
        "$mod, G, togglegroup"

        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"
        "$mod, LEFT, movefocus, l"
        "$mod, DOWN, movefocus, d"
        "$mod, UP, movefocus, u"
        "$mod, RIGHT, movefocus, r"

        "$mod_SHIFT, H, movewindow, l"
        "$mod_SHIFT, J, movewindow, d"
        "$mod_SHIFT, K, movewindow, u"
        "$mod_SHIFT, L, movewindow, r"
        "$mod_SHIFT, LEFT, movewindow, l"
        "$mod_SHIFT, DOWN, movewindow, d"
        "$mod_SHIFT, UP, movewindow, u"
        "$mod_SHIFT, RIGHT, movewindow, r"
      ]
      ++ (
        # workspaces
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod_SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        )
      );

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
