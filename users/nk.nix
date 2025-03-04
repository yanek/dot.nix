{ userSettings, ... }:

{
  imports = [
    ./modules/zsh.nix
    ./modules/core.nix
    ./modules/nvim.nix
    ./modules/tmux.nix
    ./modules/starship.nix
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
