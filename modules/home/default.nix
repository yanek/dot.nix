{config, ...}: {
  imports = [
    ./user-dirs.nix
    ./services
    ./term
    ./window-manager/bspwm
    ./themes
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];
}
