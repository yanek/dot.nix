{
  pkgs,
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
      padding-left = "35%";
      padding-top = "35%";
      result-spacing = 25;
      num-results = 5;
      background-color = background;
      input-background = no_background;
      prompt-backgound = no_background;
      default-result-background = no_background;
      selection-background = no_background;
      font-size = lib.mkForce 24;
    };
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
  programs.swayimg.enable = true;

  # Notification service
  services.mako = {
    enable = true;
    borderRadius = 3;
    defaultTimeout = 8000;
  };

  # Idle management (auto-lock, monitor off, etc)
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 900;
        command = "swaylock";
      }
      {
        timeout = 1200;
        command = "swaymsg output * dpms off";
        resumeCommand = "swaymsg output * dpms on";
      }
    ];
  };

  home.packages = with pkgs; [
    rofi-wayland
    pavucontrol
    nemo
    gcr # Provides org.gnome.keyring.SystemPrompter
  ];
}
