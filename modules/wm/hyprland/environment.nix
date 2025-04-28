{ pkgs, ... }:

{
  imports = [
    ../../programs/waybar/waybar.nix
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

  };

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
    ];
  };
}
