{config, ...}: {
  imports = [
    ./services
    ./term
    ./window-manager/bspwm
    ./themes

    ./comms.nix
    ./user-dirs.nix
    ./web-browser.nix
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];
}
