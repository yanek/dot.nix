{ pkgs, userSettings, ... }:

let
  wallpaper = "${userSettings.homeDir}/.nixos-config/modules/themes/${userSettings.theme}/wallpaper.png";
in
{
  imports = [
    ../../programs/waybar/waybar.nix
  ];

  programs.waybar.systemd.enable = true;

  programs.wofi = {
    enable = true;
  };

  programs.wlogout = {
    enable = true;
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        path = "screenshot";
        blur_passes = 3;
        blur_size = 4;
      };

    };
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

  home.packages = with pkgs; [
    nemo
    nemo-fileroller
  ];
}
