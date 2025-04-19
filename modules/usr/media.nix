{ pkgs, ... }:

{
  home.packages = with pkgs; [
    spotify
    vlc
    gimp
  ];

  programs.spotify-player.enable = true;
}
