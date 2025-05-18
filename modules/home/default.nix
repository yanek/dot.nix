{config, ...}: {
  imports = [
    ./services
    ./shell
    ./term
    ./themes
    ./window-manager/bspwm

    ./comms.nix
    ./user-dirs.nix
    ./web-browser.nix
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];
}
