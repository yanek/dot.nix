{
  pkgs,
  lib,
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

  # Notification service
  services.mako = {
    enable = true;
    borderRadius = 3;
    defaultTimeout = 8000;
  };

  # Image viewer
  programs.swayimg.enable = true;

  home.packages = with pkgs; [
    rofi-wayland
    pavucontrol
    nemo
    gcr # Provides org.gnome.keyring.SystemPrompter
  ];
}
