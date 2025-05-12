{
  pkgs,
  config,
  lib,
  userSettings,
  ...
}: {
  # Dmenu
  programs.tofi = let
    background = lib.mkForce "#000A";
    no_background = lib.mkForce "#0000";
  in {
    enable = true;
    settings = {
      width = "100%";
      height = "100%";
      border-width = 0;
      outline-width = 0;
      padding-left = "45%";
      padding-top = "30%";
      result-spacing = 5;
      num-results = 10;
      background-color = background;
      input-background = no_background;
      prompt-background = no_background;
      default-result-background = no_background;
      selection-background = no_background;
      text-cursor = true;
      fuzzy-match = true;
      font-size = lib.mkForce 14;
    };
  };

  home.activation = {
    # https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
    regenerateTofiCache = lib.hm.dag.entryAfter ["writeBoundary"] ''
      tofi_cache=${config.xdg.cacheHome}/tofi-drun
      [[ -f "$tofi_cache" ]] && rm "$tofi_cache"
    '';
  };

  # Audio visualizer
  programs.cava = {
    enable = true;
  };

  # Lockscreen
  programs.swaylock = let
    wallpaper = "${userSettings.dirs.theme}/wallpaper.png";
  in {
    enable = true;
    settings = {
      image = wallpaper;
      indicator-idle-visible = true;
    };
  };

  # Image viewer
  programs.swayimg = {
    enable = true;
  };

  # Notification service
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 8000;
    };
  };

  # Idle management (auto-lock, monitor off, etc)
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 290;
        command = "${pkgs.libnotify}/bin/notify-send 'Locking in 10 seconds' -t 10000";
      }
      {
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock";
      }
      {
        timeout = 330;
        command = "${pkgs.sway}/bin/swaymsg 'output * dpms off'";
        resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * dpms on'";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock";
      }
    ];
  };

  home.packages = with pkgs; [
    pavucontrol
    nemo
    gnome-calculator
    sway-contrib.grimshot
    gcr # Provides org.gnome.keyring.SystemPrompter
  ];
}
