{ config, ... }:
{
  imports = [
    ./helix
    ./neovim
    ./services # TODO: rename and split
    ./shell
    ./term
    ./themes
    ./window-manager

    ./comms.nix
    ./documents.nix
    ./gimp.nix
    ./git.nix
    ./jellytui.nix
    ./print-3d.nix
    ./redshift.nix
    ./spotify.nix
    ./user-dirs.nix
    ./vlc.nix
    ./web-browser.nix
    ./yazi.nix
  ];

  home = {
    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
    ];
  };

  programs = {
    nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "weekly";
      };
    };
    tealdeer = {
      enable = true;
    };
  };
}
