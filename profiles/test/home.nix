{ userSettings, ... }:

{
  imports = [
    ../../user/sh.nix
    ../../user/nvim/default.nix
    ../../user/git.nix
    ../../user/tmux.nix
    ../../user/tldr.nix
    ../../user/ripgrep.nix
    ../../user/fzf.nix
    ../../user/zoxide.nix
    ../../user/starship.nix
    ../../user/eza.nix
    ../../user/bat.nix
  ];

  home.username = "${userSettings.username}";
  home.homeDirectory = "/home/${userSettings.username}";

  home.stateVersion = "24.05";

  home.sessionPath = [
    "/home/${userSettings.username}/.dotfiles/bin"
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.home-manager.enable = true;
}
