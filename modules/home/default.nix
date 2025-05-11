{config, ...}: {
  imports = [
    ./user-dirs.nix
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];
}
