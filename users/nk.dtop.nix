{
  lib,
  config,
  ...
}: {
  imports = [
    ../modules/home
  ];

  myHome = {
    gimp.enable = true;
    print-3d.enable = true;
    windowManager.bspwm = {
      monitors = ["DP-4" "DP-2"];
      extraStartupPrograms = [
        "spotify"
        "sleep 5 && vesktop"
        "sleep 5 && openrgb -m static -c cd3c0a"
      ];
    };
    windowManager.i3 = {
      extraStartupPrograms = [
        {command = "(sleep 3 && vesktop)";}
        {command = "steam";}
        {command = "openrgb -m static -c cd3c0a";}
        {command = "spotify";}
      ];
    };
  };

  xsession.windowManager.i3.config.workspaceOutputAssign = lib.mkIf config.myHome.windowManager.i3.enable [
    {
      output = "DP-4";
      workspace = "1";
    }
    {
      output = "DP-4";
      workspace = "2";
    }
    {
      output = "DP-4";
      workspace = "3";
    }
    {
      output = "DP-4";
      workspace = "4";
    }
    {
      output = "DP-2";
      workspace = "5";
    }
    {
      output = "DP-2";
      workspace = "6";
    }
    {
      output = "DP-2";
      workspace = "7";
    }
    {
      output = "DP-2";
      workspace = "8";
    }
  ];
}
