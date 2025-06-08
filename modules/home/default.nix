{ config, ... }:
{
  imports = [
    ./editor
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
    ./prune-dir.nix
    ./redshift.nix
    ./spotify.nix
    ./torrent-catcher.nix
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

    fish.shellAbbrs = {
      "nhh" = "nh home switch ${config.home.homeDirectory}/.nixos-config";
      "nho" = "nh os switch ${config.home.homeDirectory}/.nixos-config";
    };
  };
}
