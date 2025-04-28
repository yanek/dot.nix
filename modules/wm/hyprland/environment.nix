{ pkgs, userSettings, ... }:

let
  wallpaper = "${userSettings.homeDir}/.nixos-config/modules/themes/${userSettings.theme}/wallpaper.png";
in
{
  imports = [
    ../../programs/waybar/waybar.nix
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = true;
      preload = [ wallpaper ];
      wallpaper = [ ",${wallpaper}" ];
    };
  };

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
    ];
  };
}
