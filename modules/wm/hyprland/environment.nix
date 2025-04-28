{ pkgs, ... }:

{
  imports = [
    ../../programs/waybar/waybar.nix
  ];

  home.packages = with pkgs; [
    wofi
  ];

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
    ];
  };
}
