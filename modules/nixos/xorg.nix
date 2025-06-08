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
      slock.enable = true;
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
        enableCtrlAltBackspace = false;
        xkb.layout = "eu";
        autoRepeatDelay = 300;
        autoRepeatInterval = 20;
        dpi = mkDefault 96;
        desktopManager.xterm.enable = false;
        windowManager.${config.mySystem.xorg.windowManager}.enable = true;
        displayManager.lightdm = {
          enable = true;
          greeters.slick.enable = true;
        };
        serverFlagsSection = ''
          Option "DontVTSwitch" "True"
        '';
      };

      # Disable mouse acceleration
      libinput = {
        enable = true;
        mouse.accelProfile = "flat";
      };
    };

    fonts.fontconfig = {
      enable = true;
      allowBitmaps = true; # Some emoji fonts seem to be considered bitmap
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

    hardware = {
      graphics.enable = true;
    };

    environment = {
      variables = {
        FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
      };
      systemPackages = with pkgs; [
        xorg.xrandr
        xclip
        xdotool
        libnotify
      ];
    };
  };
}
