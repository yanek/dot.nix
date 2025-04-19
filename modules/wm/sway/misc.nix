{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi-wayland
    lxappearance
    wdisplays
    pavucontrol
    xfce.thunar
  ];
}
