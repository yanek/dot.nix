{config, ...}: {
  imports = [
    ./user-dirs.nix
    ./services
    ./term
    ./window-manager/bspwm
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];
}
