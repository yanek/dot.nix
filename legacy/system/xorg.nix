{
  pkgs,
  userSettings,
  ...
}: {
  programs = {
    dconf.enable = true;
    i3lock = {
      enable = true;
      package = pkgs.i3lock;
    };
  };

  services = {
    displayManager = {
      defaultSession = "none+bspwm";
      autoLogin = {
        enable = true;
        user = userSettings.username;
      };
    };

    xserver = {
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
    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
    };
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
