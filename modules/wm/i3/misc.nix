{ pkgs, ... }:

{
  home.packages = with pkgs; [
    autotiling
    rofi
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
