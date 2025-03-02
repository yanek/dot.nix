{ userSettings, ... }:

{
  imports = [
    ../../user/nvim/default.nix
    ../../user/sh.nix
    ../../user/git.nix
    ../../user/tmux.nix
    ../../user/tldr.nix
    ../../user/ripgrep.nix
  ];

  home.username = "${userSettings.username}";
  home.homeDirectory = "/home/${userSettings.username}";

  home.stateVersion = "24.05";

  home.sessionPath = [
    "/home/${userSettings.username}/.dotfiles/bin"
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
