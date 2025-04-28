{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind =
      [
        "$mod_SHIFT, Q, killactive"
        "$mod, RETURN, exec, kitty"
        "$mod, D, exec, rofi -show drun"
        "$mod, W, exec, rofi -show window"
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
