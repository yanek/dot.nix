{ pkgs, ... }:

{
  home.packages = [
    pkgs.starship
  ];

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = pkgs.lib.importTOML ../raw/starship.toml;
  };
}
