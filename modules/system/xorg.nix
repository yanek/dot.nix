{
  pkgs,
  ...
}:

{
  programs.dconf.enable = true;
  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw

  services.displayManager = {
    # defaultSession = "none+i3";
  };

  services.xserver = {
    enable = true;
    xkb.layout = "eu";

    desktopManager.xterm.enable = false;
    # windowManager.i3.enable = true;
  };

  # Disable mouse acceleration
  services.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
  };

  environment.systemPackages = with pkgs; [
    xorg.xrandr
    xclip
  ];
}
