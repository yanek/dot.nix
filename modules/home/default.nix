{config, ...}: {
  imports = [
    ./helix
    ./neovim
    ./services # TODO: rename and split
    ./shell
    ./term
    ./themes
    ./window-manager/bspwm

    ./comms.nix
    ./gimp.nix
    ./git.nix
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
