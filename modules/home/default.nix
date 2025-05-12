{config, ...}: {
  imports = [
    ./user-dirs.nix
    ./services
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];
}
