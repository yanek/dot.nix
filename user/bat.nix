{ pkgs, ... }:

{
  home.packages = [
    pkgs.bat
  ];

  programs.fish = {
    shellAliases = {
      cat = "bat --theme=gruvbox-dark";
    };
  };
}
