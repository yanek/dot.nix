{ pkgs, ... }:

{
  home.packages = with pkgs; [
    autotiling
    rofi
    dunst
    feh
    lxappearance
    pango
    maim
    pavucontrol
    siji
    xfce.thunar
    pulsemixer
  ];
}
