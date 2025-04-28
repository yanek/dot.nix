{ pkgs, ... }:

{
  home.programs = with pkgs; [
    rofi-wayland
  ];
}
