{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    spotify
    vlc
    gimp
  ];
}
