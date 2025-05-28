{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:
with lib;
{
  options.mySystem.xorg = {
    enable = mkEnableOption "xorg";
    windowManager = mkOption {
      type = with types; uniq str;
    };
  };

  config = mkIf config.mySystem.xorg.enable {
    programs = {
      dconf.enable = true;
      i3lock = {
        enable = true;
        package = pkgs.i3lock;
      };
    };

    services = {
      displayManager = {
        defaultSession = "none+${config.mySystem.xorg.windowManager}";
        autoLogin = {
          enable = true;
          user = userSettings.username;
        };
      };

      xserver = {
        enable = true;
        xkb.layout = "eu";
        autoRepeatDelay = 300;
        autoRepeatInterval = 20;
        dpi = 96;
        desktopManager.xterm.enable = false;
        windowManager.bspwm.enable = config.mySystem.xorg.windowManager == "bspwm";
        windowManager.i3.enable = config.mySystem.xorg.windowManager == "i3";
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
        autohint = false;
        style = "full";
      };
      subpixel = {
        lcdfilter = "default";
        rgba = "rgb";
      };
    };

    hardware = {
      graphics.enable = true;
    };

    environment.systemPackages = with pkgs; [
      xorg.xrandr
      xclip
      xdotool
      libnotify
    ];
  };
}
