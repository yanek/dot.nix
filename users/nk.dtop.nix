{...}: {
  imports = [
    ../legacy/programs/prusa-slicer.nix
    ../legacy/programs/multimedia/gimp.nix
    ../modules/home
  ];

  myHome = {
    gimp.enable = true;
    windowManager.bspwm = {
      monitors = ["DP-4" "DP-2"];
      extraStartupPrograms = [
        "spotify"
        "sleep 5 && vesktop"
        "sleep 5 && openrgb -m static -c cd3c0a"
      ];
    };
  };
}
