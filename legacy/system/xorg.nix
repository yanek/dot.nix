{
  pkgs,
  userSettings,
  ...
}: {
  programs.dconf.enable = true;
  environment.pathsToLink = ["/libexec"]; # links /libexec from derivations to /run/current-system/sw

  services.displayManager = {
    defaultSession = "none+bspwm";
    autoLogin = {
      enable = true;
      user = userSettings.username;
    };
  };

  services.xserver = {
    enable = true;
    xkb.layout = "eu";
    autoRepeatDelay = 400;
    autoRepeatInterval = 30;
    dpi = 96;
    desktopManager.xterm.enable = false;
    windowManager.bspwm.enable = true;
    displayManager.lightdm = {
      enable = true;
      greeters.slick.enable = true;
    };
  };

  # Disable mouse acceleration
  services.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
  };

  fonts.fontconfig = {
    enable = true;
    allowBitmaps = false;
    antialias = true;
    hinting = {
      enable = true;
      autohint = true;
      style = "slight";
    };
    subpixel = {
      lcdfilter = "default";
      rgba = "rgb";
    };
  };

  environment.systemPackages = with pkgs; [
    xorg.xrandr
    xclip
    xdotool
    libnotify
  ];
}
