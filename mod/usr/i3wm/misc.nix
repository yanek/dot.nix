{ pkgs, ... }:

{
  home.packages = with pkgs; [
    autotiling
    rofi
    lxappearance
    pango
    maim
    pavucontrol
    siji
    xclip
    xdotool
    xfce.thunar
    xorg.xrandr
    pulsemixer
  ];
}
