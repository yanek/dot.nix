{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi-wayland
    # wdisplays
    pavucontrol
    xfce.thunar
    nemo
    blueberry
  ];
}
