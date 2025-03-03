{ userSettings, ... }:

{
  imports = [
    ./modules/sh.nix
    ./modules/nvim.nix
    ./modules/git.nix
    ./modules/tmux.nix
    ./modules/tldr.nix
    ./modules/ripgrep.nix
    ./modules/fzf.nix
    ./modules/zoxide.nix
    ./modules/starship.nix
    ./modules/eza.nix
    ./modules/bat.nix
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
