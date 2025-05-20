{config, ...}: {
  imports = [
    ./helix
    ./neovim
    ./services # TODO: rename and split
    ./shell
    ./term
    ./themes
    ./window-manager/bspwm
    ./window-manager/i3

    ./comms.nix
    ./documents.nix
    ./gimp.nix
    ./git.nix
    ./print-3d.nix
    ./spotify.nix
    ./user-dirs.nix
    ./vlc.nix
    ./web-browser.nix
    ./yazi.nix
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
    };
  };
}
