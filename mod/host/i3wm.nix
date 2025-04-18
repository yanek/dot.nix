{
  pkgs,
  ...
}:

{
  programs.dconf.enable = true;
  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw

  services.displayManager = {
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
    picom
    polybar
    dunst
    feh
  ];
}
