{
  pkgs,
  userSettings,
  ...
}:

{
  programs.dconf.enable = true;
  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw

  services.displayManager = {
    lightdm.enable = true;
    lightdm.autologin = {
      enable = true;
      user = userSettings.username;
    };
    defaultSession = "none+i3";
  };

  services.xserver = {
    enable = true;
    xkb.layout = "eu";

    windowManager.i3.enable = true;

    desktopManager = {
      xterm.enable = false;
    };
  };

  services.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
  };

  environment.systemPackages = with pkgs; [
    autotiling
    rofi
    picom
    polybar
    dunst
    feh
    lxappearance
    maim
    pango
    pavucontrol
    siji # font required by polybar
    xclip
    xdotool
    xfce.thunar
    xorg.xrandr
    pulsemixer
    nordic
  ];
}
