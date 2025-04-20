{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi-wayland
    pavucontrol
    nemo
    blueberry
  ];
}
