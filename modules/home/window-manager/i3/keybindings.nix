{
  pkgs,
  lib,
  config,
  ...
}:
{
  keybindings = {
    "Mod4+Return" = "exec ${config.myHome.term.command}";
    "Mod4+q" = "kill";
    "Mod4+d" = "exec ${lib.getExe pkgs.rofi} -show drun";
    "Mod4+p" = "exec ${lib.getExe pkgs.rofi-rbw}";

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
    "Mod4+equal" = "resize grow width 200px";
    "Mod4+minus" = "resize shrink width 200px";

    "Print" =
      "exec ${lib.getExe pkgs.maim} --window $(${lib.getExe pkgs.xdotool} getactivewindow) | ${lib.getExe pkgs.xclip} -selection clipboard -t image/png";
    "Shift+Print" =
      "exec ${lib.getExe pkgs.maim} --select | ${lib.getExe pkgs.xclip} -selection clipboard -t image/png";

    "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
    "XF86AudioLowerVolume" = "exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-";
    "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    "XF86AudioPlay" = "exec ${lib.getExe pkgs.playerctl} play-pause -p spotify_player";

    "Mod4+XF86AudioPlay" = "exec rofi -show sink -modes sink:rofi_sinks";

    # Brightness settings.
    # Maybe this could be restricted to hosts with monitor brightness support,
    # but it doesn't really matter.
    "XF86MonBrightnessUp" = "exec ${lib.getExe pkgs.brightnessctl} set +10%";
    "XF86MonBrightnessDown" = "exec ${lib.getExe pkgs.brightnessctl} set 10%-";

    "Mod4+Shift+c" = "reload";
    "Mod4+Shift+r" = "restart";

    "Mod4+r" = "mode resize";
    "Mod4+Escape" = "exec rofi -show power -modes power:rofi_power";
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
