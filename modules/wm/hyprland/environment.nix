{ pkgs, ... }:

{
  imports = [
    ../../programs/waybar/waybar.nix
  ];

  home.packages = with pkgs; [
    rofi-wayland
  ];

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
    ];
  };
}
