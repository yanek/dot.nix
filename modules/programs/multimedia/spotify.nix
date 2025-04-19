{ pkgs, ... }:

{
  home.packages = [
    pkgs.spotify
  ];

  programs.spotify-player.enable = true;
}
