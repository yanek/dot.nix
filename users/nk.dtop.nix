{...}: {
  imports = [
    ../legacy/programs/prusa-slicer.nix
    ../legacy/programs/multimedia/gimp.nix
    ../modules/home
  ];

  myHome.windowManager.bspwm.monitors = ["DP-4" "DP-6"];
}
