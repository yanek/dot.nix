{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.displayManager = {
    defaultSession = "none+bspwm";
    lightdm = {
      enable = true;
      greeter.enable = true;
    };
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "euro";
  };

  environment.systemPackages = with pkgs; [
    polybar
    xclip
    rofi
    xfce.thunar
    zathura # document viewer
    dunst # notification daemon
  ];
}
