{config, ...}: {
  imports = [
    ./user-dirs.nix
    ./services
    ./window-manager/bspwm
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];
}
